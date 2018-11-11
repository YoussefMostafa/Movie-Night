//
//  MNNavigationBar.swift
//  Movie Night
//
//  Created by Youssef Mostafa on 11/9/18.
//  Copyright © 2018 UsefDev. All rights reserved.
//

import UIKit

class MNNavigationBar: UINavigationBar {
    
    // MARK: - Attributes
    
    private let gradientColors: [CGColor] = [
        UIColor.rgb(0, 181, 255, 1).cgColor,
        UIColor.rgb(254, 25, 250, 1).cgColor
    ]
    
    var title: String {
        get {
            return navBarTitle.text ?? ""
        }
        set {
            navBarTitle.text = newValue
        }
    }
    
    // MARK: - Views
    
    private let navBarTitle: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.textColor = .white
        label.sizeToFit()
        return label
    }()
    
    private let rightButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .clear
        return button
    }()
    
    private let leftButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .clear
        return button
    }()
    
    // MARK: - LifeCycle Methods
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupSubViews()
        setupConstraints()
    }
    
    private func setupUI() {
       setupGradient()
    }
    
    private func setupSubViews() {
        addSubview(navBarTitle)
        addSubview(rightButton)
        addSubview(leftButton)
    }
    
    private func setupConstraints() {
        navBarTitle.centerInSuperView(safeArea: true)
        leftButton.edgesToSuperView(exclude: .trailling, width: 44, height: nil, padding: 0, safeArea: true)
        rightButton.edgesToSuperView(exclude: .leading, width: 44, height: nil, padding: 0, safeArea: true)
    }
    
    private func setupGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.type = .axial
        gradientLayer.startPoint = CGPoint(x: 0, y: 1)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.frame = frame
        layer.addSublayer(gradientLayer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
