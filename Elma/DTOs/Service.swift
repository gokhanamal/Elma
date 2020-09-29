//
//  Service.swift
//  Elma
//
//  Created by Gokhan Namal on 29.09.2020.
//  Copyright © 2020 Gokhan Namal. All rights reserved.
//

import Foundation

struct Service: Decodable {
    let id: Int
    let serviceId: Int
    let name: String
    let longName: String
    let imageURL: String
    let proCount: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case serviceId = "service_id"
        case name
        case longName = "long_name"
        case imageURL = "image_url"
        case proCount = "pro_count"
    }
}
