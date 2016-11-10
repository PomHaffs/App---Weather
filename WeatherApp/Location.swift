//
//  Location.swift
//  WeatherApp
//
//  Created by Tomas-William Haffenden on 11/11/16.
//  Copyright © 2016 PomHaffs. All rights reserved.
//

import CoreLocation

class Location {
//GLOBAL VARIABLE
    static var sharedInstance = Location()
    private init() {}
    
    var latitude: Double!
    var longitude: Double!
    
}
