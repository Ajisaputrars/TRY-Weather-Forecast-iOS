//
//  CurrentWeather.swift
//  RainyShiny
//
//  Created by Aji Saputra Raka Siwi on 4/19/17.
//  Copyright © 2017 Aji Saputra Raka Siwi. All rights reserved.
//

import UIKit
import Alamofire

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
    
//    func downloadWeatherDetails(completed: DownloadComplete) {
//        //Alomofire Does This
//        let currentWeatherURL = URL(string: CURRENT_WEATHER_URL)!
//        Alamofire.request(currentWeatherURL).responseJSON { response in
//            let result = response.result
//            
//            if let dict = result.value as? Dictionary<String, AnyObject> {
//                if let name = dict["name"] as? String {
//                    self._cityName = name.capitalized
//                    print(self.CityName)
//                }
//                
//                if let weather = dict["weather"] as? [Dictionary<String,AnyObject>] {
//                    if let main = weather[0]["main"] as? String {
//                        self._weatherType = main.capitalized
//                        print(self.WeatherType)
//                    }
//                }
//                
//                if let main = dict["main"] as? Dictionary<String, AnyObject> {
//                    if let currentTemperature = main["temp"] as? Double {
//                        self._currentTemp = currentTemperature
//                        print(self.CurrentTemp)
//                    }
//                }
//            }
//            completed()
//        }
//    }
//}

    func downloadWeatherDetails(completed: @escaping DownloadComplete) {
        //Download Current Weather Data
        Alamofire.request(CURRENT_WEATHER_URL).responseJSON { response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let name = dict["name"] as? String {
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
                    
                    if let currentTemperature = main["temp"] as? Double {
                        
                        let kelvinToFarenheitPreDivision = (currentTemperature * (9/5) - 459.67)
                        
                        let kelvinToFarenheit = Double(round(10 * kelvinToFarenheitPreDivision/10))
                        
                        self._currentTemp = kelvinToFarenheit
                        print(self._currentTemp)
                    }
                }
            }
            completed()
        }
    }
}

