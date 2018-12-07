//
//  HomeCollectionHeaderView.swift
//  Movie Night
//
//  Created by Youssef Mostafa on 12/7/18.
//  Copyright © 2018 UsefDev. All rights reserved.
//

import UIKit

class HomeCollectionHeaderView: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    private func setupUI() {
        textColor = .white
        textAlignment = .left
        font = UIFont.systemFont(ofSize: 23, weight: .heavy)
        layer.opacity = 9.5
        text = "Now Playing"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
