//
//  HomeViewModel.swift
//  Elma
//
//  Created by Gokhan Namal on 10.09.2020.
//  Copyright © 2020 Gokhan Namal. All rights reserved.
//

import Foundation

final class HomeViewModel: HomeViewModelProtocol {
    var networkService: ElmaNetworkServiceProtocol
    weak var view: HomeViewDelegate?
    
    init(networkService: ElmaNetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func viewDidLoad() {
        view?.handleOutput(.setLoading(true))
        networkService.getServices{ [weak self] result in
            guard let `self` = self else { return }
            switch(result) {
            case .success(let response):
                let posts = response.posts.map{PostPresentation(title: $0.title, category: $0.category, imageURL: $0.imageURL, link: $0.link)}
                let trending = response.trending.map{ServicePresentation(id: $0.id, name: $0.name, proCount: $0.proCount, imageURL: $0.imageURL)}
                let others = response.other.map{ServicePresentation(id: $0.id, name: $0.name, proCount: $0.proCount, imageURL: $0.imageURL)}
                
                var sections = [Section]()
                
                sections.append(Section(title: "Trending services", items: trending, cellType: .trending))
                sections.append(Section(title: "Other services", items: others, cellType: .other))
                sections.append(Section(title: "Latest from the blog", items: posts, cellType: .post))
                
                self.view?.handleOutput(.showList(sections))
                self.view?.handleOutput(.setLoading(false))
            case .failure(let error):
                self.view?.handleOutput(.showError(error.localizedDescription))
                self.view?.handleOutput(.setLoading(false))
            }
            
        }
    }
    
    func select(item: SectionItem, cellType: CellType) {
        if cellType != .post {
            let service = item as! ServicePresentation
            let viewModel = ServiceDetailsViewModel(serviceId: service.id, networkService: networkService)
            view?.navigate(to: .serviceDetails(viewModel))
        } else {
            let post = item as! PostPresentation
            guard let url = URL(string: post.link) else { return }
            view?.handleOutput(.openURL(with: url))
        }
    }
}
