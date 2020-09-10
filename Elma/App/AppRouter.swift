//
//  AppRouter.swift
//  Elma
//
//  Created by Gokhan Namal on 10.09.2020.
//  Copyright © 2020 Gokhan Namal. All rights reserved.
//

import UIKit

class AppRouter {
    var window: UIWindow?
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        let tabBarController = UITabBarController()
        let homeVC = HomeBuilder.make()
        tabBarController.viewControllers = [homeVC]
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }
}
