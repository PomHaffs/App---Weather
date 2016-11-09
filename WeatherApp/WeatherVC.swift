//
//  WeatherVC.swift
//  WeatherApp
//
//  Created by Tomas-William Haffenden on 8/11/16.
//  Copyright © 2016 PomHaffs. All rights reserved.
//

import UIKit

class WeatherVC: UIViewController, UITableViewDelegate, UITableViewDataSource {


    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var currentWeatherImage: UIImageView!
    @IBOutlet weak var currentWeatherTypeLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var currentWeather = CurrentWeather()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //this tells comp where to find the dependancies above
        tableView.delegate = self
        tableView.dataSource = self
        
        currentWeather.downloadWeatherDetails {
            //set up UI to DL data
        }

    }
    
    //this is need for all tableView things 1 of 3
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    //this is 2 of 3
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    //this is 3 of 3 - creates generic cell for duplication
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //ID MUST link to table ID in storyboard
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath)
        
        return cell
    }
    
    
    
    
}

