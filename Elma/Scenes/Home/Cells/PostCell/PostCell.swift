//
//  PostCell.swift
//  Elma
//
//  Created by Gokhan Namal on 11.09.2020.
//  Copyright © 2020 Gokhan Namal. All rights reserved.
//

import UIKit

final class PostCell: UICollectionViewCell {
    static let reuseIdentifier = "PostCell"
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupGradient()
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
    }
    
    private func setupGradient() {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = [UIColor.black.withAlphaComponent(0.1).cgColor, UIColor.black.cgColor]
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: imageView.frame.size.width, height: imageView.frame.size.height)
        
        imageView.layer.insertSublayer(gradient, at: 0)
    }
    
    func setupCell(post: PostPresentation) {
        imageView.downloadImage(string: post.imageURL)
        imageView.contentMode = .scaleAspectFill
        
        titleLabel.text = post.title
        categoryLabel.text = post.category
    }
}
