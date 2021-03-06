//
//  WeatherVC.swift
//  WeatherApp
//
//  Created by Tomas-William Haffenden on 8/11/16.
//  Copyright © 2016 PomHaffs. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire

class WeatherVC: UIViewController, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate {


    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var currentWeatherImage: UIImageView!
    @IBOutlet weak var currentWeatherTypeLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
//LOCATION INIT
    let locationManger = CLLocationManager()
    var currentLocation: CLLocation!
    
    var currentWeather = CurrentWeather()
//as above but for mini data on app
    var forecast: Forecast!
//need the below array to store all JSON forecast info
    var forecasts = [Forecast]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//LOCATION SETUP
        locationManger.delegate = self
        locationManger.desiredAccuracy = kCLLocationAccuracyBest
        locationManger.requestWhenInUseAuthorization()
        locationManger.startMonitoringSignificantLocationChanges()
        
        currentWeather = CurrentWeather()
        
//this tells comp where to find the dependancies above
        tableView.delegate = self
        tableView.dataSource = self

        //MOVED TO AFTER LOCATION NEEDED
//        currentWeather.downloadWeatherDetails {
//            self.downloadForecastData {
//                self.updateMainUI()
//            }
//   
//        }

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        locationAuthStatus()
    }
    
    func locationAuthStatus() {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            currentLocation = locationManger.location
//Saving to singleton class LOCATION.swift = GLOBAL
            Location.sharedInstance.latitude = currentLocation.coordinate.latitude
            Location.sharedInstance.longitude = currentLocation.coordinate.longitude
            currentWeather.downloadWeatherDetails {
                self.downloadForecastData {
                    self.updateMainUI()
                }
                
            }
        } else {
            locationManger.requestWhenInUseAuthorization()
            locationAuthStatus()
        }
    }
    
    func downloadForecastData(completed: DownloadComplete) {
//Download forecast data for table view
        Alamofire.request(FORECAST_URL).responseJSON { response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let list = dict["list"] as? [Dictionary<String, AnyObject>] {
//loop goes thru all forecast and store ALL info in above array
                    for obj in list {
                        let forecast = Forecast(weatherDict: obj)
                        self.forecasts.append(forecast)
                        //print(obj)
                    }
//need to remove first because want tomorrows data
                    self.forecasts.remove(at: 0)
//reload needed to ensure new data is there to pull into view
                    self.tableView.reloadData()
                }
                
            }
            
        }
       completed()     
    }
    
//this is need for all tableView things 1 of 3
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
//this is 2 of 3
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//this is important or an 'INDEX out of range' err will happen
        return forecasts.count
    }
//this is 3 of 3 - creates generic cell for duplication
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//ID MUST link to table ID in storyboard
        if let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as? WeatherCell {
            
            let forecast = forecasts[indexPath.row]
            cell.configureCell(forecast: forecast)
            return cell
        } else {
            return WeatherCell()
        }
        
    }
    
    func updateMainUI() {
        dateLabel.text = currentWeather.date
//turns double into a string cos UILabel needs string
        currentTempLabel.text = "\(currentWeather.currentTemp)"
        currentWeatherTypeLabel.text = currentWeather.weatherType
        locationLabel.text = currentWeather.cityName
//this is a hack where you name all your img the same name as what is returned
        currentWeatherImage.image = UIImage(named: currentWeather.weatherType)
        
    }
    
    
}

