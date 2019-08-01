//
//  OPCity.swift
//  OptusWeather
//
//  Created by sanjay chauhan on 01/08/19.
//  Copyright © 2019 techm. All rights reserved.
//

import Foundation

struct OPCity: Codable {
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
    }
    
    var id: Int
    var name: String
}

