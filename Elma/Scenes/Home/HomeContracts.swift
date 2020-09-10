//
//  HomeContracts.swift
//  Elma
//
//  Created by Gokhan Namal on 10.09.2020.
//  Copyright © 2020 Gokhan Namal. All rights reserved.
//

import class UIKit.UINavigationController

protocol HomeBuilderProtocol {
    static func make() -> UINavigationController
}

protocol HomeViewModelProtocol {
    var view: HomeViewDelegate? { get set }
    func viewDidLoad()
}

protocol HomeViewDelegate: class {    
    func handleOutput(_ output: HomeViewModelOutputs)
}

enum HomeViewModelOutputs {
    case setLoading(Bool)
    case showTrendingServicesList([ServicePresentation])
    case showOtherServicesList([ServicePresentation])
    case showPostsList([PostPresentation])
}
