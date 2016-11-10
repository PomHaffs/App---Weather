//
//  WeatherCell.swift
//  WeatherApp
//
//  Created by Tomas-William Haffenden on 10/11/16.
//  Copyright © 2016 PomHaffs. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {
    
    //these are all the mini info bits
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var weatherType: UILabel!
    @IBOutlet weak var highTemp: UILabel!
    @IBOutlet weak var lowTemp: UILabel!
    
    func configureCell(forecast: Forecast){
        //this changes double to string
        lowTemp.text = "\(forecast.lowTemp)"
        highTemp.text = "\(forecast.highTemp)"
        weatherType.text = forecast.weatherType
        //this only works because we gave images the same name as the weather type
        weatherIcon.image = UIImage(named: forecast.weatherType)
        dayLabel.text = forecast.date
    }



}
