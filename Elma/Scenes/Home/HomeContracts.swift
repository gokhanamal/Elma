//
//  HomeContracts.swift
//  Elma
//
//  Created by Gokhan Namal on 10.09.2020.
//  Copyright © 2020 Gokhan Namal. All rights reserved.
//

import UIKit

protocol HomeBuilderProtocol {
    static func make() -> UINavigationController
}

protocol HomeViewModelProtocol {
    var view: HomeViewDelegate? { get set }
    func viewDidLoad()
    func select(item: SectionItem , cellType: CellType)
}

protocol HomeViewDelegate: class {    
    func handleOutput(_ output: HomeViewModelOutputs)
    func navigate(to route: HomeViewRoute)
}

enum HomeViewModelOutputs {
    case setLoading(Bool)
    case showList([Section])
    case openURL(with: URL)
}

enum HomeViewRoute {
    case serviceDetails(ServiceDetailsViewModel)
}


struct Section {
    let title: String
    let items: [SectionItem]
    let cellType: CellType
}

protocol SectionItem { }

enum CellType {
    case post
    case trending
    case other
}
