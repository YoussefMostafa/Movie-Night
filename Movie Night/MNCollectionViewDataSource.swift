//
//  MNCollectionViewDataSource.swift
//  Movie Night
//
//  Created by Youssef Mostafa on 12/2/18.
//  Copyright © 2018 UsefDev. All rights reserved.
//

import UIKit

class MNCollectionViewDataSource<Model>: NSObject, UICollectionViewDataSource {
    
    // MARK: Props
    
    typealias CellConfigurator = (UICollectionViewCell, Model) -> Void
    
    var models: [Model]
    var reuseIdentifier: String
    var cellConfigurator: CellConfigurator
    
    // Mark: - Initializer
    
    init(cellIdentifier: String, models: [Model], _ cellConfigurator: @escaping CellConfigurator) {
        self.models = models
        self.reuseIdentifier = cellIdentifier
        self.cellConfigurator = cellConfigurator
    }
    
    // MARK: Methods

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return models.count >= 10 ? 10 : models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        cellConfigurator(cell, models[indexPath.item])
        return cell
    }
    
    
}
