@testable import Elma
//
//  ElmaNetworkServiceMock.swift
//  ElmaTests
//
//  Created by Gokhan Namal on 13.09.2020.
//  Copyright © 2020 Gokhan Namal. All rights reserved.
//

import Foundation

final class ElmaNetworkServiceMock: ElmaNetworkServiceProtocol {
    func getServices(completion: @escaping (Result<ServicesResponse, Error>) -> Void) {
        completion(.success(.fake()))
    }
    
    func getService(id: Int, completion: @escaping (Result<ServiceDetailsResponse, Error>) -> Void) {
        completion(.success(.fake(id: id)))
    }
}

extension Service {
    static func fake() -> Service {
        return Service(id: 1, serviceId: 1, name: "Ev isleri", longName: "Ev isleri", imageURL: "https://cdn.armut.com/images/services/00191-ev-temizligi_thumb_875x500.jpg", proCount: 1000)
    }
}

extension Post {
    static func fake() -> Post {
        return Post(title: "Ev isleri", category: "EV ISLERI", imageURL: "https://cdn.armut.com/images/services/00191-ev-temizligi_thumb_875x500.jpg", link: "https://blog2.armut.com/blog/6-maddede-derin-dondurucu-temizligi-nasil-yapilir")
    }
}

extension ServicesResponse {
    static func fake() -> ServicesResponse {
        return ServicesResponse(trending: [.fake()], other: [.fake()], posts: [.fake()])
    }
}

extension ServiceDetailsResponse {
    static func fake(id: Int) -> ServiceDetailsResponse {
        return ServiceDetailsResponse(id: id, serviceId: id, name: "Ev isleri", longName: "Ev isleri", imageURL: "https://cdn.armut.com/images/services/00191-ev-temizligi_thumb_875x500.jpg", proCount: 1000, rating: 4.0, completedJobs: 5000)
    }
}
