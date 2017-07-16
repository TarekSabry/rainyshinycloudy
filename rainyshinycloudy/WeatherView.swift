//
//  WeatherView.swift
//  rainyshinycloudy
//
//  Created by Tarek Sabry on 7/6/17.
//  Copyright © 2017 Tarek Sabry. All rights reserved.
//

import UIKit

class WeatherView: UIView {
    @IBOutlet weak var date : UILabel!
    @IBOutlet weak var temp : UILabel!
    @IBOutlet weak var location : UILabel!
    @IBOutlet weak var image : UIImageView!
    @IBOutlet weak var status : UILabel!
    
    func configureView(data : WeatherData) {
        date.text = data._currentDate
        temp.text = "\(Int(data._currentTemp))°"
        location.text = data._currentLocation
        image.image = data._currentImage
        status.text = data._currentStatus
        
    }
}
