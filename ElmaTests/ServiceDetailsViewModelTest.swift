//
//  ServiceDetailsViewModelTest.swift
//  ElmaTests
//
//  Created by Gokhan Namal on 13.09.2020.
//  Copyright © 2020 Gokhan Namal. All rights reserved.
//


import XCTest
@testable import Elma

class ServiceDetailsViewModelTest: XCTestCase {
    private var viewModel: ServiceDetailsViewModelProtocol!
    private var view: ServiceDetailsViewMock!
    
    override func setUp() {
        super.setUp()
        let networkService = ElmaNetworkServiceMock()
        viewModel = ServiceDetailsViewModel(serviceId: 1, networkService: networkService)
        view = ServiceDetailsViewMock()
        viewModel.view = view
        
        viewModel.viewDidLoad()
    }

    func testExample() throws {
        // setLoading(true), showDetails(), setLoading(false)
        XCTAssertEqual(view.outputs.count, 3)
        
        XCTAssertEqual(view.outputs[0], .setLoading(true))
        
        XCTAssertEqual(view.outputs[1], .showDetails(.fake(), []))

        XCTAssertEqual(view.outputs[2], .setLoading(false))
    }
}

private class ServiceDetailsViewMock: ServiceDetailsViewDelegate {
    var outputs = [ServiceDetailsOutputs]()
    
    func handleOutput(_ output: ServiceDetailsOutputs) {
        outputs.append(output)
    }
}

extension ServiceDetailsPresentation {
    static func fake() -> ServiceDetailsPresentation {
        let fakeResponse = ServiceDetailsResponse.fake(id: 1)
        return ServiceDetailsPresentation(imageURL: fakeResponse.imageURL, name: fakeResponse.name)
    }
}
