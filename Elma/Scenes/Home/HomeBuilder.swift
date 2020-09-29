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
        let viewController = storyboard.instantiateInitialViewController() as! HomeViewController
        
        // setup tabbar item
        let image = UIImage(named: "services")?.withRenderingMode(.alwaysOriginal)
        viewController.tabBarItem = UITabBarItem(title: "Services", image: image, selectedImage: image)
        viewController.tabBarItem.setTitleTextAttributes([.foregroundColor: UIColor.darkGray], for: .selected)
        viewController.tabBarItem.setTitleTextAttributes([.foregroundColor: UIColor.systemBlue], for: .normal)
    
        let networkService = ElmaNetworkService()
        viewController.viewModel = HomeViewModel(networkService: networkService)
        
        let navigationController = UINavigationController(rootViewController: viewController)
        return navigationController
    }
}
