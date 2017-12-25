//
//  CurrentWeather.swift
//  RainyShiny
//
//  Created by Aji Saputra Raka Siwi on 4/19/17.
//  Copyright © 2017 Aji Saputra Raka Siwi. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class CurrentWeather {
    var _cityName: String!
    var _date: String!
    var _weatherType: String!
    var _currentTemp: Double!
    
    var CityName: String {
        if _cityName == nil {
            _cityName = "kosngan bro"
        }
        return _cityName
    }
    
    var WeatherType: String {
        if _weatherType == nil {
            _weatherType = "Clouds"
        }
        return _weatherType
    }
    
    var Date: String {
        if _date == nil {
            _date = ""
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let dateNow = NSDate() as Date
        let currentDate = dateFormatter.string(from: dateNow)
        self._date = "Today \(currentDate)"
        
        return _date
    }
    
    var CurrentTemp: Double {
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
        return _currentTemp
    }
    
    func downloadWeatherDetails(completed: @escaping DownloadComplete) {
        Alamofire.request(CURRENT_WEATHER_URL).responseJSON { response in
            let json = JSON(response.result.value!)
            let name = json["name"].stringValue
            self._cityName = name.capitalized
            
            if let weather = json["weather"].arrayObject as? [Dictionary<String, AnyObject>] {
                if let main = weather[0]["main"] as? String {
                    self._weatherType = main.capitalized
                    print("MainName yang baru adalah \(main)")
                }
            }
            
            if let currentTemperatureInRawNumber = json["main"]["temp"].object as? Double {
                let kelvinToFarenheitPreDivision = (currentTemperatureInRawNumber * (9/5) - 459.67)
                let kelvinToFarenheit = Double(round(10 * kelvinToFarenheitPreDivision/10))
                self._currentTemp = kelvinToFarenheit
                
                print("Current Weather Temperature adalah \(kelvinToFarenheit)")
            }
            completed()
        }
    }
}
