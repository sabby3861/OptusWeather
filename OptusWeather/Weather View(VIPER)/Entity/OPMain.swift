//
//  OPMain.swift
//  OptusWeather
//
//  Created by techm on 31/07/19.
//  Copyright © 2019 techm. All rights reserved.
//

import Foundation
struct OPMain: Codable {
    enum CodingKeys: String, CodingKey {
        case temp = "temp"
        case minTemp = "temp_min"
        case maxTemp = "temp_max"
        case humidity = "humidity"
    }
    
    // MARK: - Objects
    var temp: Double
    var minTemp: Double
    var maxTemp: Double
    var humidity: Double
 
    // MARK: - Decodable
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.temp = (try container.decodeIfPresent(Double.self, forKey: .temp))!
        self.minTemp = (try container.decodeIfPresent(Double.self, forKey: .minTemp))!
        self.maxTemp = (try container.decodeIfPresent(Double.self, forKey: .maxTemp))!
        self.humidity = (try container.decodeIfPresent(Double.self, forKey: .humidity))!
    }
    
    // MARK: - Encodable
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(temp, forKey: .temp)
        try container.encode(minTemp, forKey: .minTemp)
        try container.encode(maxTemp, forKey: .maxTemp)
        try container.encode(humidity, forKey: .humidity)
    }
}
