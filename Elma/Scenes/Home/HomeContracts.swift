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

protocol SectionItem { }

enum HomeViewModelOutputs: Equatable {
    case setLoading(Bool)
    case showList([Section])
    case openURL(with: URL)
    case showError(String)
    static func == (lhs: HomeViewModelOutputs, rhs: HomeViewModelOutputs) -> Bool {
        switch (lhs, rhs) {
        case (.setLoading(let a), .setLoading(let b)):
            return a == b
        case (.showList(let a), .showList(let b)):
            return a.count == b.count
        case (.openURL(with: let a), .openURL(with: let b)):
            return a == b
        case (.showError(let a), .showError(let b)):
            return a == b
        default:
            return false
        }
    }
}

enum HomeViewRoute {
    case serviceDetails(ServiceDetailsViewModel)
}

enum CellType {
    case post
    case trending
    case other
}

struct Section {
    let title: String
    let items: [SectionItem]
    let cellType: CellType
}

struct ServicePresentation: SectionItem {
    let id: Int
    let name: String
    let proCount: Int
    let imageURL: String
}

struct PostPresentation: SectionItem {
    let title: String
    let category: String
    let imageURL: String
    let link: String
}
