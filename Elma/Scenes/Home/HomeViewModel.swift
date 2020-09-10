//
//  HomeViewModel.swift
//  Elma
//
//  Created by Gokhan Namal on 10.09.2020.
//  Copyright © 2020 Gokhan Namal. All rights reserved.
//

import Foundation

final class HomeViewModel: HomeViewModelProtocol {
    var service: ElmaServiceProtocol
    weak var view: HomeViewDelegate?
    
    init(service: ElmaServiceProtocol) {
        self.service = service
    }
    
    func viewDidLoad() {
        service.getServices{ [weak self] result in
            guard let `self` = self else { return }
            switch(result) {
            case .success(let response):
                let posts = response.posts.map{_ in PostPresentation()}
                self.view?.handleOutput(.showPostsList(posts))
                
                let trending = response.trending.map{_ in ServicePresentation()}
                self.view?.handleOutput(.showTrendingServicesList(trending))
                
                let others = response.posts.map{_ in ServicePresentation()}
                self.view?.handleOutput(.showOtherServicesList(others))
            case .failure(let error):
                print(error)
            }
            
        }
    }
}
