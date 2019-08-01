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
        case daytimeInformation = "sys"
        case windInformation = "wind"
        case cloudCoverage = "clouds"
    }
    
    // MARK: - Objects
    var id: Int
    var visibility: Int32?
    var name: String?
    var main: OPMain?
    var weatherCondition: [OPWeatherCondition]
    var daytimeInformation: OPDaytimeInformation?
    var windInformation: OPWindInformation
    var cloudCoverage: OPCloudCoverage
    
    // MARK: - Decodable
     init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if let id = try container.decodeIfPresent(Int.self, forKey: .id) {
            self.id = id
        } else {
            self.id = 0
        }
        if let visibility = try container.decodeIfPresent(Int32.self, forKey: .visibility) {
            self.visibility = visibility
        } else {
            self.visibility = 0
        }
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        if let main = try container.decodeIfPresent(OPMain.self, forKey: .main) {
            self.main = main
        }
        self.weatherCondition = try container.decodeIfPresent([OPWeatherCondition].self, forKey: .weatherCondition)!
        self.daytimeInformation = try container.decodeIfPresent(OPDaytimeInformation.self, forKey: .daytimeInformation)
        self.windInformation = (try container.decodeIfPresent(OPWindInformation.self, forKey: .windInformation))!
        self.cloudCoverage = (try container.decodeIfPresent(OPCloudCoverage.self, forKey: .cloudCoverage))!
    }
    
    // MARK: - Encodable
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(visibility, forKey: .visibility)
        try container.encode(name, forKey: .name)
        try container.encode(main, forKey: .main)
        try container.encode(weatherCondition, forKey: .weatherCondition)
        try container.encode(daytimeInformation, forKey: .daytimeInformation)
        try container.encode(windInformation, forKey: .windInformation)
        try container.encode(cloudCoverage, forKey: .cloudCoverage)
    }
}
