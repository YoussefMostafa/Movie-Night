//
//  MNNavigationController.swift
//  Movie Night
//
//  Created by Youssef Mostafa on 11/18/18.
//  Copyright © 2018 UsefDev. All rights reserved.
//

import UIKit

class MNNavigationController: UINavigationController {
    
    // MARK: - Attributes
    
    private var gradientColors: [CGColor] {
        return [
            UIColor.rgb(0, 181, 255, 1).cgColor,
            UIColor.rgb(254, 25, 250, 1).cgColor
        ]
    }
    
    // MARK: - LifeCycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    open override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupGradient()
    }
    
    // MARK: - Class Methods
    
    private func setupUI() {
        isNavigationBarHidden = true
    }
    
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
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        if let topVC = viewControllers.last {
            return topVC.preferredStatusBarStyle
        }
        return .lightContent
    }
}
