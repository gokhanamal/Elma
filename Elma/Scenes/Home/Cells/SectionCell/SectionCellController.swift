//
//  SectionCellController.swift
//  Elma
//
//  Created by Gokhan Namal on 10.09.2020.
//  Copyright © 2020 Gokhan Namal. All rights reserved.
//

import UIKit

final class SectionCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var sectionTitleLabel: UILabel!
    
    weak var delegate: HomeViewController!
    
    static let reuseIdentifier = "SectionCell"
    private var section: Section!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        let serviceNib = UINib(nibName: ServiceCell.reuseIdentifier, bundle: nil)
        collectionView.register(serviceNib, forCellWithReuseIdentifier: ServiceCell.reuseIdentifier)
        
        let postNib = UINib(nibName: PostCell.reuseIdentifier, bundle: nil)
        collectionView.register(postNib, forCellWithReuseIdentifier: PostCell.reuseIdentifier)
    }
    
    func setupCell(section: Section) {
        self.section = section
        sectionTitleLabel.text = section.title
        collectionView.reloadData()
    }
}

extension SectionCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.section.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if(section.cellType != .post) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ServiceCell.reuseIdentifier, for: indexPath) as! ServiceCell
            let service = section.items[indexPath.row] as! ServicePresentation
            cell.setupCell(item: service)
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCell.reuseIdentifier, for: indexPath) as! PostCell
        let post = section.items[indexPath.row] as! PostPresentation
        cell.setupCell(post: post)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate.viewModel.select(item: section.items[indexPath.row], cellType: section.cellType)
    }
}
