//
//  TVHomeCollectionController.swift
//  Movie Night
//
//  Created by Youssef Mostafa on 12/9/18.
//  Copyright © 2018 UsefDev. All rights reserved.
//

import UIKit

class TVHomeCollectionController: MNCollectionViewController<TV, HomeCollectionCell<TV>> {
    
    // MARK: - Props
    
    var type: CollectionType?
    
    // MARK: - Methods
    
    override func setupUI() {
        super.setupUI()
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
    }
    
    override func fetchData() {
        guard let type = type, let endPoint = type.endPoint else {return}
        APIManager.fetchData(endPoint: endPoint) { (data: TVRequestedPage?, error) in
            if let error = error {
                print("\n\(error.localizedDescription)\n")
                return
            }
            guard let series = data?.series else { return }
            self.dataSource = series
        }
    }
    
    override func setupSubViews() {
        view.addSubview(collectionView)
    }
    
    override func setupConstraints() {
        collectionView.edgesToSuperView()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let dataSource = dataSource else { return 0 }
        return dataSource.count >= 10 ? 10 : dataSource.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 140, height: 249)
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
    
}
