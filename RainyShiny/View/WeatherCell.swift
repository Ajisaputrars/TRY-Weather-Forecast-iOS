//
//  WeatherCell.swift
//  RainyShiny
//
//  Created by Aji Saputra Raka Siwi on 4/20/17.
//  Copyright © 2017 Aji Saputra Raka Siwi. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var weatherType: UILabel!
    @IBOutlet weak var highTemp: UILabel!
    @IBOutlet weak var lowTemp: UILabel!
    
    func configureCell(forecast: Forecast){
        dayLabel.text = String(forecast.date)
        lowTemp.text = String(forecast.lowTemp)
        highTemp.text = forecast.highTemp
        weatherType.text = forecast.weatherType
        weatherIcon.image = UIImage(named: forecast.weatherType)
    }
}
