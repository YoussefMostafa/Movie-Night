//
//  GradientController.swift
//  Movie Night
//
//  Created by Youssef Mostafa on 2/17/19.
//  Copyright © 2019 UsefDev. All rights reserved.
//

import UIKit

class GradientController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        doShemmering()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    func doShemmering() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.opacity = 0.5
        let angle = 45 * CGFloat.pi/180
        gradientLayer.transform = CATransform3DMakeRotation(angle, 0, 0, 1)
        let color = UIColor.white
        color.withAlphaComponent(0.5)
        let color1 = UIColor(white: 1, alpha: 0.5)
        let color2 = UIColor(white: 1, alpha: 0.1)
        gradientLayer.colors = [color2.cgColor, color1.cgColor]
        gradientLayer.locations = [0,1]
        view.layer.addSublayer(gradientLayer)
        
        gradientLayer.frame = CGRect(x: 0, y: 0, width: 100, height: view.frame.height)
//        view.layer.mask = gradientLayer
        let animation = CABasicAnimation(keyPath: "transform.translation.x")
        animation.fromValue = -view.frame.width
        animation.toValue = view.frame.width
        animation.repeatCount = Float.infinity
        animation.duration = 2
        gradientLayer.add(animation, forKey: "gradientAnimation")
        
//        myView.layer.addSublayer(gradientLayer)
    }
    
}
