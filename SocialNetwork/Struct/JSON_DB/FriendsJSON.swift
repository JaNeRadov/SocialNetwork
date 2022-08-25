//
//  FriendsJSON.swift
//  SocialNetwork
//
//  Created by Jane Z. on 23.08.2022.
//

import Foundation

struct Friends: Decodable {
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        response = try container.decode(FriendsResponse.self, forKey: .response)
    }
    
    let response: FriendsResponse
    
    enum CodingKeys: String, CodingKey {
        case response
    }
}

struct FriendsResponse: Decodable {
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        count = try container.decode(Int.self, forKey: .count)
        items = try container.decode(FriendsItems.self, forKey: .items)
    }
    let count: Int
    let items: FriendsItems
    
    enum CodingKeys: String, CodingKey {
        case count
        case items
    }
}

struct FriendsItems: Decodable {
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        trackCode = try container.decode(String.self, forKey: .trackCode)
        photoFifty = try container.decode(String.self, forKey: .photoFifty)
        firstName = try container.decode(String.self, forKey: .firstName)
        lastName = try container.decode(String.self, forKey: .lastName)
        canAccessClosed = try container.decode(Bool.self, forKey: .canAccessClosed)
        isClosed = try container.decode(Bool.self, forKey: .isClosed)
    }
    let id: Int
    let trackCode: String
    let photoFifty: String
    let firstName: String
    let lastName: String
    let canAccessClosed: Bool
    let isClosed: Bool
    
    enum CodingKeys: String, CodingKey {
        case id
        case trackCode = "track_code"
        case photoFifty = " photo_50"
        case firstName = "first_name"
        case lastName = "last_name"
        case canAccessClosed = "can_access_closed"
        case isClosed = "is_closed"
    }
}
