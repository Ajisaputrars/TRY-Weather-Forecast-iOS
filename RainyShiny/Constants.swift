//
//  Constants.swift
//  RainyShiny
//
//  Created by Aji Saputra Raka Siwi on 4/19/17.
//  Copyright © 2017 Aji Saputra Raka Siwi. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let API_KEY = "a5b8552ee45399f16f15d9e947bbe269"

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)36\(LONGITUDE)123\(APP_ID)\(API_KEY)"

typealias DownloadComplete = () -> ()
