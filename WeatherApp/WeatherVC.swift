//
//  WeatherVC.swift
//  WeatherApp
//
//  Created by Tomas-William Haffenden on 8/11/16.
//  Copyright © 2016 PomHaffs. All rights reserved.
//

import UIKit

class WeatherVC: UIViewController {


    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var currentWeatherImage: UIImageView!
    @IBOutlet weak var currentWeatherTypeLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

