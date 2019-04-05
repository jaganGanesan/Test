//
//  RootClass.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on April 5, 2019

import Foundation

struct RootClass : Codable {

        let completed : Bool?
        let id : Int?
        let title : String?
        let userId : Int?

        enum CodingKeys: String, CodingKey {
                case completed = "completed"
                case id = "id"
                case title = "title"
                case userId = "userId"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                completed = try values.decodeIfPresent(Bool.self, forKey: .completed)
                id = try values.decodeIfPresent(Int.self, forKey: .id)
                title = try values.decodeIfPresent(String.self, forKey: .title)
                userId = try values.decodeIfPresent(Int.self, forKey: .userId)
        }

}
