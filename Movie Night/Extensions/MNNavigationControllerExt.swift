//
//  MNNavigationControllerExt.swift
//  Movie Night
//
//  Created by Youssef Mostafa on 11/11/18.
//  Copyright © 2018 UsefDev. All rights reserved.
//

import UIKit

extension UINavigationController {
    
    private var gradientColors: [CGColor] {
        return [
            UIColor.rgb(0, 181, 255, 1).cgColor,
            UIColor.rgb(254, 25, 250, 1).cgColor
        ]
    }
    
    // MARK: - LyfeCycle Methods
    
    open override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupGradient()
    }
    
    
    // MARK: - Class Methods
    
    private func setupGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.type = .axial
        gradientLayer.startPoint = CGPoint(x: 0, y: 1)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        setFramesFor(gradientLayer)
    }
    
    private func setFramesFor(_ gradientLayer: CALayer) {
        let navigationBarFrame = CGRect(x: 0, y: -view.safeAreaInsets.top, width: view.bounds.width, height: 44+view.safeAreaInsets.top)
        gradientLayer.frame = navigationBarFrame
        navigationBar.layer.insertSublayer(gradientLayer, at: 1)
    }
    
}
