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
            _currentTemp = 0.0
        }
        return _currentTemp
    }
    //'completed:...' must be declared in constains file type alias
    func downloadWeatherDetails(completed: @escaping DownloadComplete) {
        //Alamo fire download info
        //removed ".GET" from arg
        Alamofire.request(CURRENT_WEATHER_URL).responseJSON { response in
            let result = response.result
            
          
//This shows how to dig into the JSON and asign values from each layer!!!!!
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
              print(dict)
                if let name  = dict["name"] as? String {
                    self._cityName = name.capitalized
                    print(self._cityName)
                }
                
                if let weather = dict["weather"] as? [Dictionary<String, AnyObject>] {
                    if let main = weather[0]["main"] as? String {
                        self._weatherType = main.capitalized
                        print(self._weatherType)
                    }
                }
                
                if let main = dict["main"] as? Dictionary<String, AnyObject> {
                    if let currentTemp = main["temp"] as? Double {

                        let kevinToCels = (round((currentTemp - 273.15)*100)/100)
                        
                        self._currentTemp = kevinToCels
                        print(self._currentTemp)
                    }
                }
            }
           completed()
        }
//        completed()
    }
    
}
