//
//  Constaints.swift
//  WeatherApp
//
//  Created by Tomas-William Haffenden on 9/11/16.
//  Copyright © 2016 PomHaffs. All rights reserved.
//

import Foundation


// this is the URL from API http://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=90456f6842bd95579efcc12db0a39f10

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let API_KEY = "90456f6842bd95579efcc12db0a39f10"

let CURRENT_WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&cnt=10&mode=json&appid=90456f6842bd95579efcc12db0a39f10"

typealias DownloadComplete = () -> ()

let FORECAST_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&cnt=10&mode=json&appid=90456f6842bd95579efcc12db0a39f10"
