//
//  Constants.swift
//  rainyshinycloudy
//
//  Created by Tarek Sabry on 7/6/17.
//  Copyright © 2017 Tarek Sabry. All rights reserved.
//

import UIKit
typealias DownloadComplete = () -> ()
let UpdateUI = Notification.Name(rawValue: "UpdateUI")
let CURRENT_WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather/?lat=\(Location.sharedInstance.latiude!)&lon=\(Location.sharedInstance.longitude!)&cnt=10&appid=7e53ee003426df3cc4702dc631fb4bca"
let weatherForecastURL = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=\(Location.sharedInstance.latiude!)&lon=\(Location.sharedInstance.longitude!)&cnt=10&appid=7e53ee003426df3cc4702dc631fb4bca"
