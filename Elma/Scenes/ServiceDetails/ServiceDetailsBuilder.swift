//
//  ServiceDetailsBuilder.swift
//  Elma
//
//  Created by Gokhan Namal on 12.09.2020.
//  Copyright © 2020 Gokhan Namal. All rights reserved.
//

import UIKit

final class ServiceDetailsBuilder: ServiceDetailsBuilderProtocol {
    static func make(viewModel: ServiceDetailsViewModel) -> UINavigationController {
        let storyBoard = UIStoryboard(name: "ServiceDetails", bundle: nil)
        
        let viewController = storyBoard.instantiateInitialViewController() as! ServiceDetailsViewController
        viewController.viewModel = viewModel
        let navigationController = UINavigationController(rootViewController: viewController)
        return navigationController
    }
}
