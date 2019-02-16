//
//  HomeCollectionHeaderView.swift
//  Movie Night
//
//  Created by Youssef Mostafa on 12/7/18.
//  Copyright © 2018 UsefDev. All rights reserved.
//

import UIKit

class HomeCollectionHeaderView: UIView {
    
    var type: CollectionType? {
        didSet {
            typeLabel.text = type?.title
        }
    }
    
    var typeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 24, weight: .heavy)
        return label
    }()
    
    var seeAllButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("See All", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        button.setTitleColor(#colorLiteral(red: 0.5568627451, green: 0.5568627451, blue: 0.5764705882, alpha: 1), for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        addSubViews()
        setupConstraints()
    }
    
    private func setupUI() {
        layer.opacity = 9.5
    }
    
    private func addSubViews() {
        addSubview(typeLabel)
        addSubview(seeAllButton)
    }
    
    private func setupConstraints() {
        typeLabel.edgesToSuperView(exclude: .trailing)
        typeLabel.anchorTrailing(seeAllButton.leadingAnchor, padding: 8)
        seeAllButton.edgesToSuperView(exclude: .leading)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
