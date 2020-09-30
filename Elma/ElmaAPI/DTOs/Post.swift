//
//  Post.swift
//  Elma
//
//  Created by Gokhan Namal on 29.09.2020.
//  Copyright © 2020 Gokhan Namal. All rights reserved.
//

import Foundation

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
