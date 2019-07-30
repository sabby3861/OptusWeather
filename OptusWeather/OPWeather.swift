//
//  OPWeather.swift
//  OptusWeather
//
//  Created by techm on 30/07/19.
//  Copyright © 2019 techm. All rights reserved.
//

import Foundation
import CoreData

 class OPWeather: NSManagedObject, Codable {
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case visibility = "visibility"
        case name = "name"
    }
    
    // MARK: - Core Data Managed Object
    @NSManaged var id: Int32
    @NSManaged var visibility: Int32
    @NSManaged var name: String?
  
    // MARK: - Decodable
    required convenience init(from decoder: Decoder) throws {
        guard let codingUserInfoKeyManagedObjectContext = CodingUserInfoKey.managedObjectContext,
            let managedObjectContext = decoder.userInfo[codingUserInfoKeyManagedObjectContext] as? NSManagedObjectContext,
            let entity = NSEntityDescription.entity(forEntityName: OPCoreData.name.rawValue, in: managedObjectContext) else {
                fatalError("Failed to decode Weather info")
        }
        
        self.init(entity: entity, insertInto: managedObjectContext)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = (try container.decodeIfPresent(Int32.self, forKey: .id))!
        self.visibility = (try container.decodeIfPresent(Int32.self, forKey: .visibility))!
        self.name = try container.decodeIfPresent(String.self, forKey: .name)

    }
    
    // MARK: - Encodable
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(visibility, forKey: .visibility)
        try container.encode(name, forKey: .name)
    }
}

public extension CodingUserInfoKey {
    // Helper property to retrieve the Core Data managed object context
    static let managedObjectContext = CodingUserInfoKey(rawValue: "managedObjectContext")
}

enum OPCoreData: String {
    case name = "OPWeatherInfo"
}
