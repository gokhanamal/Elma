//
//  ServiceCell.swift
//  Elma
//
//  Created by Gokhan Namal on 10.09.2020.
//  Copyright © 2020 Gokhan Namal. All rights reserved.
//

import UIKit

class ServiceCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var proCountLabel: UILabel!
    static let reuseIdentifier = "ServiceCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
    }
    
    func setupCell(item: ServicePresentation) {
        imageView.downloadImage(string: item.imageURL)
        imageView.contentMode = .scaleAspectFit
        titleLabel.text = item.name
        proCountLabel.text = "\(item.proCount) \(item.proCount > 1 ? "Pros" : "Pro") near you"
    }
}
