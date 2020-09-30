//
//  HomeViewModelTest.swift
//  ElmaTests
//
//  Created by Gokhan Namal on 13.09.2020.
//  Copyright © 2020 Gokhan Namal. All rights reserved.
//

import XCTest
@testable import Elma
class HomeViewModelTest: XCTestCase {
    private var viewModel: HomeViewModelProtocol!
    private var view: HomeViewMock!
    
    override func setUp() {
        super.setUp()
        let networkService = ElmaNetworkServiceMock()
        viewModel = HomeViewModel(networkService: networkService)
        view = HomeViewMock()
        viewModel.view = view
        
        viewModel.viewDidLoad()
    }

    func testExample() throws {
        // setLoading(true), showList(), setLoading(false)
        XCTAssertEqual(view.outputs.count, 3)
        
        XCTAssertEqual(view.outputs[0], .setLoading(true))
        
        // I just check the sections count that's why this case doesn't fail
        XCTAssertEqual(view.outputs[1], .showList(Section.fake()))
        
        XCTAssertEqual(view.outputs[2], .setLoading(false))
    }
}

private class HomeViewMock: HomeViewDelegate {
    var outputs = [HomeViewModelOutputs]()
    
    func navigate(to route: HomeViewRoute) {
        
    }
    
    func handleOutput(_ output: HomeViewModelOutputs) {
        outputs.append(output)
    }
}

extension Section {
    static func fake() -> [Section] {
        return [
            Section(title: "fake1", items: [], cellType: .trending),
            Section(title: "fake1", items: [], cellType: .post),
            Section(title: "fake1", items: [], cellType: .other)
        ]
    }
}
