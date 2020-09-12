//
//  ServiceDetails.swift
//  Elma
//
//  Created by Gokhan Namal on 12.09.2020.
//  Copyright © 2020 Gokhan Namal. All rights reserved.
//

import Foundation

struct ServiceDetailsResponse: Codable {
    let id: Int
    let serviceId: Int
    let name: String
    let longName: String
    let imageURL: String
    let proCount: Int
    let rating: Double?
    let completedJobs: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case serviceId = "service_id"
        case name
        case longName = "long_name"
        case imageURL = "image_url"
        case proCount = "pro_count"
        case rating = "average_rating"
        case completedJobs = "completed_jobs_on_last_month"
    }
}
