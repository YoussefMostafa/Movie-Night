//
//  HomeCollectionHeaderView.swift
//  Movie Night
//
//  Created by Youssef Mostafa on 12/7/18.
//  Copyright © 2018 UsefDev. All rights reserved.
//

import UIKit

class HomeCollectionHeaderView: UILabel {
    
    var type: CollectionType? {
        didSet {
            text = type?.title
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    private func setupUI() {
        textColor = .white
        textAlignment = .left
        font = UIFont.systemFont(ofSize: 24, weight: .heavy)
        layer.opacity = 9.5
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
