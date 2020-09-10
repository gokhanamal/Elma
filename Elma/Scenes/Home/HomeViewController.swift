//
//  ViewController.swift
//  Elma
//
//  Created by Gokhan Namal on 10.09.2020.
//  Copyright © 2020 Gokhan Namal. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
    var viewModel: HomeViewModelProtocol! {
        didSet {
            viewModel?.view = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "🍎Elma"
        viewModel.viewDidLoad()
    }
}

extension HomeViewController: HomeViewDelegate {
    func handleOutput(_ output: HomeViewModelOutputs) {
        switch output {
        case .setLoading(_):
            break;
        case .showTrendingServicesList(_):
            break;
        case .showOtherServicesList(_):
            break;
        case .showPostsList(_):
            break;
        }
    }
}
