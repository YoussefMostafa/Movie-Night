//
//  HomeCollectionCell.swift
//  Movie Night
//
//  Created by Youssef Mostafa on 11/30/18.
//  Copyright © 2018 UsefDev. All rights reserved.
//

import UIKit

class HomeCollectionCell: MNCollectionViewCell {
    
    // MARK: - Views
    
    private let contentImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let contentRate: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .center
        label.backgroundColor = UIColor.rgb(74, 74, 74, 0.9)
        return label
    }()
    
    private let contentDescription: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.layer.opacity = 0.95
        label.backgroundColor = .clear
        return label
    }()
    
    // MARK: - LifeCycle Methods
    
    override func setupUI() {
        layer.cornerRadius = 4
        layer.masksToBounds = true
    }
    
    override func setupSubViews() {
        addSubview(contentImageView)
        addSubview(contentRate)
        addSubview(contentDescription)
    }
    
    override func setupConstraints() {
        contentImageView.edgesToSuperView()
        
        contentRate.anchorTop(topAnchor, padding: 8)
        contentRate.anchorLeading(leadingAnchor, padding: 8)
        contentRate.set(width: 44, height: 20)
        
        contentDescription.edgesToSuperView(exclude: .top)
        contentDescription.anchorTop(contentImageView.bottomAnchor, padding: 7)
        contentDescription.setHeight(44)
    }
    
    
}
