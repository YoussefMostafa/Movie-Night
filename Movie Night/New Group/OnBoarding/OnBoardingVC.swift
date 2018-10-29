//
//  OnBoardingVC.swift
//  Movie Night
//
//  Created by Youssef Mostafa on 10/29/18.
//  Copyright © 2018 UsefDev. All rights reserved.
//

import UIKit
import TinyConstraints

class OnBoardingVC: UIViewController {
    
    // MARK: Views
    
    private let backgroundImageView: UIImageView = {
        let image = UIImage(named: "OnboardingBackgroundImage")
        let imageView = UIImageView(image: image)
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        setupConstraints()
    }
    
    private func addSubViews() {
        // superView
        view.addSubview(backgroundImageView)
    }
    
    private func setupConstraints() {
        backgroundImageView.edgesToSuperview()
    }
 

}
