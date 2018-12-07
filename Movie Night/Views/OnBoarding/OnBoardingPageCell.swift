//
//  OnBoardingPageCell.swift
//  Movie Night
//
//  Created by Youssef Mostafa on 10/29/18.
//  Copyright © 2018 UsefDev. All rights reserved.
//

import Foundation
import UIKit

class OnBoardingPageCell: MNCollectionViewCell<String>{
    
    // MARK: Props
    
    var introText: String? {
        get {
            return introTextLabel.text
        }
        set {
            introTextLabel.text = newValue
        }
    }
    
    
    // MARK: Views
    
    private let introTextLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 32, weight: .semibold)
        label.textColor = .white
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    
    // MARK: LifeCycle
    
    override func setupSubViews() {
        addSubview(introTextLabel)
    }
    
    override func setupConstraints() {
        introTextLabel.anchor(
            top: topAnchor,
            leading: leadingAnchor,
            padding: UIPadding(top: 165, left: 32),
            width: 267
        )
    }
    
    override func setupUI() {
        backgroundColor = .clear
        introTextLabel.adjustsFontSizeToFitWidth = true
    }
    
}

