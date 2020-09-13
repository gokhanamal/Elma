//
//  ServiceDetailsContracts.swift
//  Elma
//
//  Created by Gokhan Namal on 12.09.2020.
//  Copyright © 2020 Gokhan Namal. All rights reserved.
//

import Foundation
import class UIKit.UINavigationController
import class UIKit.UIImage

protocol ServiceDetailsBuilderProtocol {
    static func make(viewModel: ServiceDetailsViewModel) -> UINavigationController
}

protocol ServiceDetailsViewModelProtocol {
    var view: ServiceDetailsViewDelegate? { get set }
    func viewDidLoad()
}

protocol ServiceDetailsViewDelegate: class {
    func handleOutput(_ output: ServiceDetailsOutputs)
}

enum ServiceDetailsOutputs: Equatable {
    case setLoading(Bool)
    case showDetails(ServiceDetailsPresentation, [InfoCell])
    case showError(String)
    static func == (lhs: ServiceDetailsOutputs, rhs: ServiceDetailsOutputs) -> Bool {
        switch (lhs, rhs) {
        case (.setLoading(let a), .setLoading(let b)):
            return a == b
        case (.showDetails(let details, _), .showDetails(let detailsNext, _)):
            return details.imageURL == detailsNext.imageURL && details.name == detailsNext.name
        case (.showError(let a), .showError(let b)):
            return a == b
        default:
            return false
        }
    }
}

struct InfoCell {
    let icon: UIImage?
    let text: NSMutableAttributedString?
}
