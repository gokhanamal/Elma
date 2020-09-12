//
//  UIImage+Ext.swift
//  Elma
//
//  Created by Gokhan Namal on 10.09.2020.
//  Copyright © 2020 Gokhan Namal. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
    func downloadImage(string: String) {
        self.image = UIImage(named: "elma")
        guard let url = URL(string: string) else { return }
        self.kf.setImage(with: url)
    }
}
