//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by Tomas-William Haffenden on 9/11/16.
//  Copyright © 2016 PomHaffs. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeather {
    
    var _cityName: String!
    var _date: String!
    var _weatherType: String!
    var _currentTemp: Double!

    //this ensures all inputs are correct, good practice
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    
    //dif for the date...DATEFORMATTER
    var date: String {
        if _date == nil {
            _date = ""
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today, \(currentDate)"
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var currentTemp: Double {
        if _currentTemp == nil {
            _currentTemp = 0
        }
        return _currentTemp
    }
    //'completed:...' must be declared in constains file type alias
    func downloadWeatherDetails(completed: DownloadComplete) {
        //Alaom fire download info
        let currentWeatherURL = URL(string: CURRENT_WEATHER_URL)!
        //removed ".GET" from arg
        Alamofire.request(currentWeatherURL).responseJSON { response in
            let result = response.result
            print(response)
        }
        completed()
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
