//
//  MNCollectionViewCell.swift
//  Movie Night
//
//  Created by Youssef Mostafa on 10/29/18.
//  Copyright © 2018 UsefDev. All rights reserved.
//

import UIKit

class MNCollectionViewCell<T>: UICollectionViewCell {
    
    // MARK: - DataSource
    
    var dataSource: T?
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupSubViews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    internal func setupUI() {}
    internal func setupSubViews() {}
    internal func setupConstraints() {}
}
