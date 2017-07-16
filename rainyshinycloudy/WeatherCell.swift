//
//  WeatherCell.swift
//  rainyshinycloudy
//
//  Created by Tarek Sabry on 7/7/17.
//  Copyright © 2017 Tarek Sabry. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    
    
    func configureCell(forecast : Forecast) {
        dayLabel.text = forecast._day
        statusLabel.text = forecast._status
        weatherImage.image = forecast._weatherImage
        maxTempLabel.text = "\(Int(forecast._maxTemp))°"
        minTempLabel.text = "\(Int(forecast._minTemp))°"
    }
}
