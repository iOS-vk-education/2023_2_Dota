//
//  Players.swift
//  Dota2Technopark
//
//  Created by Grigory Don on 12.03.2024.
//

import Foundation

struct PlayerRecord: Codable {
    let accountId: Int
    let personaName: String
    let avatarFull: URL
    let similarity: Double

    enum CodingKeys: String, CodingKey {
        case accountId = "account_id"
        case personaName = "personaname"
        case avatarFull = "avatarfull"
        case similarity
    }
}

extension PlayerRecord {
    static func parse(jsonData: Data) -> [PlayerRecord]? {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        do {
            let records = try decoder.decode([PlayerRecord].self, from: jsonData)
            return records
        } catch {
            print("Error decoding JSON: \(error)")
            return nil
        }
    }
}
