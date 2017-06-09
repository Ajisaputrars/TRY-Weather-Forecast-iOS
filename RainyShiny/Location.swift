//
//  Location.swift
//  RainyShiny
//
//  Created by Aji Saputra Raka Siwi on 4/20/17.
//  Copyright © 2017 Aji Saputra Raka Siwi. All rights reserved.
//

import Foundation
import CoreLocation

class Location {
    static var sharedInstance = Location()
    private init() {}
    
    var latitude: Double!
    var longitude: Double!
}
