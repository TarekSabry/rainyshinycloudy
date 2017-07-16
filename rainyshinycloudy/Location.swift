//
//  Location.swift
//  rainyshinycloudy
//
//  Created by Tarek Sabry on 7/7/17.
//  Copyright © 2017 Tarek Sabry. All rights reserved.
//

import CoreLocation

class Location {
    static var sharedInstance = Location()
    private init() {}
    var longitude : Double!
    var latiude : Double!
}
