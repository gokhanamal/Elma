//
//  GetServices.swift
//  Elma
//
//  Created by Gokhan Namal on 10.09.2020.
//  Copyright © 2020 Gokhan Namal. All rights reserved.
//

import Foundation

struct ServicesResponse: Decodable {
    var trending: [Service]
    var other: [Service]
    var posts: [Post]
}

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

struct Post: Decodable {
    var title: String
    var category: String
    var imageURL: String
    var link: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case category
        case imageURL = "image_url"
        case link
    }
}
