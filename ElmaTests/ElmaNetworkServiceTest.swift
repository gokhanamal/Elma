//
//  NetworkServiceTest.swift
//  ElmaTests
//
//  Created by Gokhan Namal on 13.09.2020.
//  Copyright © 2020 Gokhan Namal. All rights reserved.
//

import Foundation
import XCTest
@testable import Elma

class ElmaNetworkServiceTest: XCTestCase {
    var mockService: ElmaNetworkServiceMock!
    
    override func setUp() {
        mockService = ElmaNetworkServiceMock()
    }
    
    func testExample() throws {
        let bundle = Bundle(for: ElmaNetworkServiceTest.self)
        let url = bundle.url(forResource: "service", withExtension: "json")!
        let data = try Data(contentsOf: url)
        let service = try JSONDecoder().decode(ServiceDetailsResponse.self, from: data)
        
        XCTAssertEqual(service.id, 191)
        XCTAssertEqual(service.serviceId, 191)
        XCTAssertEqual(service.name, "Ev Temizliği")
        XCTAssertEqual(service.longName, "Ev Temizliği")
        XCTAssertEqual(service.imageURL, "https://cdn.armut.com/images/services/00191-ev-temizligi_thumb_875x500.jpg")
        XCTAssertEqual(service.proCount, 7513)
        XCTAssertEqual(service.rating, 4.8)
        XCTAssertEqual(service.completedJobs, 14556)
        
        mockService.getService(id: 100) { result in
            switch(result) {
                case .success(let gameResponse):
                    XCTAssertEqual(gameResponse.id, 100)
                XCTAssertEqual(gameResponse.serviceId, 100)
            case .failure(_):
                XCTFail("Failed to testing getGame")
            }
        }
    }
}
