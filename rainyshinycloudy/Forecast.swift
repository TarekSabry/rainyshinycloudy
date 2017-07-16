//
//  Forecast.swift
//  rainyshinycloudy
//
//  Created by Tarek Sabry on 7/7/17.
//  Copyright © 2017 Tarek Sabry. All rights reserved.
//

import UIKit
import Alamofire

class Forecast {
    private var day : String!
    private var status : String!
    private var minTemp : Double!
    private var maxTemp : Double!
    private var weatherImage : UIImage!
    private var dt : Double!
    
    var _day : String {
        if day == nil {
            day = ""
        }
        let date = Date(timeIntervalSince1970: dt)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        day = dateFormatter.string(from: date)
        return day
    }
    
    var _status : String {
        if status == nil {
            status = ""
        }
        return status
    }
    
    var _minTemp : Double {
        if minTemp == nil {
            minTemp = 0.0
        }
        return minTemp - 272.15
    }
    
    var _maxTemp : Double {
        if maxTemp == nil {
            maxTemp = 0.0
        }
        return maxTemp - 272.15
    }
    
    var _weatherImage : UIImage {
        if weatherImage == nil {
            weatherImage = UIImage()
        }
        weatherImage = UIImage(named: self.status)
        return weatherImage
    }
    
    init(weatherObject : AnyObject) {
        if let tempDict = weatherObject["temp"] as? Dictionary<String,AnyObject> {
            if let minTempJSON = tempDict["min"] as? Double {
                minTemp = minTempJSON
            }
            if let maxTempJSON = tempDict["max"] as? Double {
                maxTemp = maxTempJSON
            }
        }
        
        if let weatherDict = weatherObject["weather"] as? [Dictionary<String,AnyObject>] {
            if let weatherStatus = weatherDict[0] as? Dictionary<String,AnyObject> {
                if let getWeatherStatus = weatherStatus["main"] as? String {
                    status = getWeatherStatus
                }
            }
        }
        if let dtJSON = weatherObject["dt"] as? Double {
            dt = dtJSON
        }
    }
}
