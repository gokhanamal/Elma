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
