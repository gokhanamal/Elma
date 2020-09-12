//
//  ServiceDetailsViewModel.swift
//  Elma
//
//  Created by Gokhan Namal on 12.09.2020.
//  Copyright © 2020 Gokhan Namal. All rights reserved.
//

import Foundation
import UIKit

final class ServiceDetailsViewModel: ServiceDetailsViewModelProtocol {
    weak var view: ServiceDetailsViewDelegate?
    private var serviceId: Int
    private var networkService: ElmaNetworkService
    private var formater: NumberFormatter {
        let numberFormater = NumberFormatter()
        numberFormater.groupingSeparator = "."
        numberFormater.numberStyle = .decimal
        return numberFormater
    }
    
    init(serviceId: Int, networkService: ElmaNetworkService) {
        self.serviceId = serviceId
        self.networkService = networkService
    }
    
    func viewDidLoad() {
        self.view?.handleOutput(.setLoading(true))
        networkService.getService(id: serviceId) { [weak self] result in
            guard let `self` = self else { return }
            switch(result) {
            case .success(let serviceData):
                let serviceDetails = ServiceDetailsPresentation(imageURL: serviceData.imageURL, name: serviceData.name, rating: serviceData.rating, completedJobs: serviceData.completedJobs)
                
                let infoCells = self.prepareInfoCells(serviceData: serviceData)
                
                self.view?.handleOutput(.showDetails(serviceDetails, infoCells))
                self.view?.handleOutput(.setLoading(false))
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func prepareInfoCells(serviceData: ServiceDetailsResponse) -> [InfoCell] {
        var infoCells = [InfoCell]()
        
        let proCount = serviceData.proCount
        let proText = prepareInfoText(of: "\(proCount)", in: "\(proCount) \(proCount > 1 ? "pros" : "pro") near you")
        let proCell = InfoCell(icon: UIImage(named: "pro"), text: proText)
        infoCells.append(proCell)
        
        if let rating = serviceData.rating {
            let ratingText = prepareInfoText(of: "\(rating)", in: "\(rating) average rating")
            let ratingCell = InfoCell(icon: UIImage(named: "star"), text: ratingText)
            infoCells.append(ratingCell)
        }
        
        if let completedJob = formater.string(from: NSNumber(value: serviceData.proCount)) {
            let completedJobText = prepareInfoText(of: "\(completedJob)", in: "Last month \(completedJob) job completed")
            let completedJobCell = InfoCell(icon: UIImage(named: "completed"), text: completedJobText)
            infoCells.append(completedJobCell)
        }
        
        let cancelCell = InfoCell(icon: UIImage(named: "cancel"), text:  NSMutableAttributedString(string: "Free of charge"))
        infoCells.append(cancelCell)
        
        let secureCell = InfoCell(icon: UIImage(named: "secure"), text:  NSMutableAttributedString(string: "Service Guaranteed"))
        infoCells.append(secureCell)
        
        return infoCells
    }
    
    private func prepareInfoText(of text: String, in mainText: String) -> NSMutableAttributedString {
        let range = (mainText as NSString).range(of: text)
        let attributedString = NSMutableAttributedString(string: mainText)
        let orange = UIColor(displayP3Red: 229/255, green: 115/255, blue: 55/255, alpha: 1)
        attributedString.addAttribute(.foregroundColor, value: orange , range: range)
        attributedString.addAttribute(.font, value: UIFont(name: "Helvetica-Bold", size: 16)! , range: range)
        return attributedString
    }
}
