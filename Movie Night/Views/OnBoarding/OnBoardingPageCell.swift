//
//  OnBoardingPageCell.swift
//  Movie Night
//
//  Created by Youssef Mostafa on 10/29/18.
//  Copyright © 2018 UsefDev. All rights reserved.
//

import Foundation
import UIKit

class OnBoardingPageCell: MNCollectionViewCell {
    
    // MARK: Attributes
    
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
    
    override func addSubViews() {
        addSubview(introTextLabel)
    }
    
    override func setupConstraints() {
        introTextLabel.anchor(top: topAnchor, bottom: nil, leading: leadingAnchor, trailling: nil, padding: UIEdgeInsets(top: 165, left: 32, bottom: 0, right: 0), width: 267, height: nil)
    }
    
    override func setupUI() {
        backgroundColor = .clear
        introTextLabel.adjustsFontSizeToFitWidth = true
    }
    
}

