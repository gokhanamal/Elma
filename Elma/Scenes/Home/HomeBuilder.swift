//
//  HomeBuilder.swift
//  Elma
//
//  Created by Gokhan Namal on 10.09.2020.
//  Copyright © 2020 Gokhan Namal. All rights reserved.
//

import UIKit

final class HomeBuilder: HomeBuilderProtocol {
    static func make() -> UINavigationController {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let vc = storyboard.instantiateInitialViewController() as! HomeViewController
        let service = ElmaService()
        vc.viewModel = HomeViewModel(service: service)
        let navigationController = UINavigationController(rootViewController: vc)
        return navigationController
    }
}
