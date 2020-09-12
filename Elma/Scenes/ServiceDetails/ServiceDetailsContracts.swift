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

enum ServiceDetailsOutputs {
    case setLoading(Bool)
    case showDetails(ServiceDetailsPresentation, [InfoCell])
}

struct InfoCell {
    let icon: UIImage?
    let text: NSMutableAttributedString?
}
