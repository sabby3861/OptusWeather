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


struct OPDaytimeInformation: Codable {
    var sunrise: Double?
    var sunset: Double?
    
    enum CodingKeys: String, CodingKey {
        case sunrise
        case sunset
    }
    
    // MARK: - Decodable
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.sunrise = (try container.decodeIfPresent(Double.self, forKey: .sunrise))!
        self.sunset = (try container.decodeIfPresent(Double.self, forKey: .sunset))!
    }
    
    // MARK: - Encodable
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(sunrise, forKey: .sunrise)
        try container.encode(sunset, forKey: .sunset)
    }
}

struct OPWindInformation: Codable {
    var windspeed: Double
    var degrees: Double?
    
    enum CodingKeys: String, CodingKey {
        case windspeed = "speed"
        case degrees = "deg"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.windspeed = try values.decode(Double.self, forKey: .windspeed)
        if values.contains(.degrees) {
            let degrees = try values.decodeIfPresent(Double.self, forKey: CodingKeys.degrees)
            self.degrees = degrees
        } else {
            self.degrees = nil
        }
    }
    
    // MARK: - Encodable
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(windspeed, forKey: .windspeed)
        try container.encode(degrees, forKey: .degrees)
    }
}

struct OPCloudCoverage: Codable {
    var coverage: Double
    
    enum CodingKeys: String, CodingKey {
        case coverage = "all"
    }
}
