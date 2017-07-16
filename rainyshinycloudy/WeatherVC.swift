//
//  ViewController.swift
//  rainyshinycloudy
//
//  Created by Tarek Sabry on 7/4/17.
//  Copyright © 2017 Tarek Sabry. All rights reserved.
//

import UIKit
import Alamofire
import CoreLocation
class WeatherVC: UIViewController,UITableViewDelegate,UITableViewDataSource,CLLocationManagerDelegate {

    @IBOutlet weak var weatherTableView: UITableView!
    @IBOutlet weak var weatherView: WeatherView!
    var locationManager = CLLocationManager()
    var currentLocation : CLLocation!
    
    let data = WeatherData()
    var weatherForecast = [Forecast]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        weatherTableView.dataSource = self
        weatherTableView.delegate = self
        locationManager.delegate = self
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startMonitoringSignificantLocationChanges()
        
    }
    
    func locationAuth() {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
           
            if let lat = locationManager.location?.coordinate.latitude,
                let lon = locationManager.location?.coordinate.latitude {
                
                Location.sharedInstance.longitude = lon
                Location.sharedInstance.latiude = lat
                print(weatherForecastURL)
                data.downloadData {
                    downloadForeCasts {
                        NotificationCenter.default.addObserver(self, selector: #selector(UpdateData), name: UpdateUI, object: nil)
                    }
                }
            }
        } else {
            locationManager.requestWhenInUseAuthorization()
            locationAuth()
        }
    }
    
    func downloadForeCasts(completed : DownloadComplete) {
        let url = URL(string: weatherForecastURL)!
        request(url).responseJSON {
            response in
            if let dict = response.value as? Dictionary<String,AnyObject> {
                if let list = dict["list"] as? [Dictionary<String,AnyObject>] {
                    for obj in list {
                        let forecast = Forecast(weatherObject: obj as AnyObject)
                        self.weatherForecast.append(forecast)
                    }
                }
            }
            self.weatherTableView.reloadData()
        }
        
        completed()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        locationAuth()
    }
    func UpdateData() {
        weatherView.configureView(data: data)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherForecast.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as! WeatherCell
        cell.configureCell(forecast: weatherForecast[indexPath.row])
        return cell
    }

}

