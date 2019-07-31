//
//  OPWeather.swift
//  OptusWeather
//
//  Created by techm on 30/07/19.
//  Copyright © 2019 techm. All rights reserved.
//

import Foundation 

struct OPMultiWeatherInfo: Codable {
    let list: [OPWeather]
}

 struct OPWeather: Codable {
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case visibility = "visibility"
        case name = "name"
        case main = "main"
        case weatherCondition = "weather"
    }
    
    // MARK: - Objects
    var id: Int32
    var visibility: Int32
    var name: String?
    var main: OPMain
    var weatherCondition: [OPWeatherCondition]
  
    // MARK: - Decodable
     init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = (try container.decodeIfPresent(Int32.self, forKey: .id))!
        self.visibility = (try container.decodeIfPresent(Int32.self, forKey: .visibility))!
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.main = (try container.decodeIfPresent(OPMain.self, forKey: .main))!
        self.weatherCondition = try container.decodeIfPresent([OPWeatherCondition].self, forKey: .weatherCondition)!
    }
    
    // MARK: - Encodable
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(visibility, forKey: .visibility)
        try container.encode(name, forKey: .name)
        try container.encode(main, forKey: .main)
        try container.encode(weatherCondition, forKey: .weatherCondition)
    }
}
