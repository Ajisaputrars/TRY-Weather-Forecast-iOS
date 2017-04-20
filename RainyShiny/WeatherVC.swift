//
//  ViewController.swift
//  RainyShiny
//
//  Created by Aji Saputra Raka Siwi on 4/18/17.
//  Copyright © 2017 Aji Saputra Raka Siwi. All rights reserved.
//

import UIKit

class WeatherVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var currentWeatherTypeLabel: UILabel!
    @IBOutlet weak var currentWeatherImage: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var currentWeather: CurrentWeather!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
       
        currentWeather = CurrentWeather()
        currentWeather.downloadWeatherDetails {
            self.updateUI()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath)
        return cell
    }
    
    func updateUI() {
        dateLabel.text = currentWeather.Date
        currentTempLabel.text = String(currentWeather.CurrentTemp)
        currentWeatherTypeLabel.text = currentWeather.WeatherType
        locationLabel.text = currentWeather.CityName
        currentWeatherImage.image = UIImage(named: currentWeather.WeatherType)
        
        
    }
}

