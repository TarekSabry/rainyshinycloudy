//
//  WeatherData.swift
//  rainyshinycloudy
//
//  Created by Tarek Sabry on 7/6/17.
//  Copyright © 2017 Tarek Sabry. All rights reserved.
//

import UIKit
import Alamofire

class WeatherData {
    private var currentDate : String!
    private var currentTemp : Double!
    private var currentLocation : String!
    private var currentStatus : String!
    private var currentImage : UIImage!
    
    var _currentImage : UIImage {
        if currentImage == nil {
            currentImage = UIImage()
        }
        currentImage = UIImage(named: currentStatus)
        return currentImage
    }
    var _currentDate : String {
       if currentDate == nil {
           currentDate = ""
       }
       let dateFormatter = DateFormatter()
       dateFormatter.timeStyle = .none
       dateFormatter.dateStyle = .long
       let formattedDate = dateFormatter.string(from: Date())
       currentDate = "Today, \(formattedDate)"
       return currentDate
    }
    
    var _currentTemp : Double {
        if currentTemp == nil {
            currentTemp = 0.00
        }
        return currentTemp
    }
    
    var _currentLocation : String {
        if currentLocation == nil {
            currentLocation = ""
        }
        return currentLocation
    }
    
    var _currentStatus : String {
        if currentStatus == nil {
            currentStatus = ""
        }
        return currentStatus
    }
    
    func downloadData(completed : DownloadComplete)
    {
        let currentWeatherURL = URL(string: CURRENT_WEATHER_URL)!
        request(currentWeatherURL).responseJSON {
            response in
            if let dict = response.value as? [String:AnyObject] {
                if let main = dict["main"] as? [String:AnyObject] {
                    if let temp = main["temp"] as? Double {
                        self.currentTemp = temp - 273.15
                    }
                }
                if let name = dict["name"] as? String {
                    self.currentLocation = name
                }
                
                if let weather = dict["weather"] as? [[String:AnyObject]] {
                    if let weatherStatus = weather[0] as? [String:AnyObject] {
                        if let weatherStatusMain = weatherStatus["main"] as? String {
                            self.currentStatus = weatherStatusMain
                        }
                    }
                }
                NotificationCenter.default.post(name: UpdateUI, object: nil, userInfo: nil)
            }
        }
        
        completed()
        
    }
    
}
