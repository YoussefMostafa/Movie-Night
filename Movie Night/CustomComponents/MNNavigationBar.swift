//
//  MNNavigationBar.swift
//  Movie Night
//
//  Created by Youssef Mostafa on 11/17/18.
//  Copyright © 2018 UsefDev. All rights reserved.
//

import UIKit

class MNNavigationBar: UINavigationBar {
    
    // MARK: - Attributes
    
    private var gradientColors: [CGColor] {
        return [
            UIColor.rgb(0, 181, 255, 1).cgColor,
            UIColor.rgb(254, 25, 250, 1).cgColor
        ]
    }
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    // MARK: - Class Methods
    
    private func setupUI() {
        setupGradient()
    }
    
    private func setupGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.type = .axial
        gradientLayer.startPoint = CGPoint(x: 0, y: 1)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.frame = frame
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
