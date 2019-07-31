//
//  OPWeatherCondition.swift
//  OptusWeather
//
//  Created by techm on 31/07/19.
//  Copyright © 2019 techm. All rights reserved.
//

import Foundation

struct OPWeatherCondition: Codable {
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case description = "description"
    }
    
    // MARK: - Object
    var id: Int32
    var description: String
    
    // MARK: - Decodable
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = (try container.decodeIfPresent(Int32.self, forKey: .id))!
        self.description = (try container.decodeIfPresent(String.self, forKey: .description))!
    }
    
    
    // MARK: - Encodable
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(description, forKey: .description)
    }
}
