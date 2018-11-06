//
//  FBLoginButton.swift
//  Movie Night
//
//  Created by Youssef Mostafa on 11/6/18.
//  Copyright © 2018 UsefDev. All rights reserved.
//

import UIKit

class FBLoginButton: UIButton {
    
    private let fbImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "FaceBookIcon"))
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupSubViews()
        setupConstraints()
    }
    
    private func setupUI() {
        backgroundColor = UIColor.rgb(59, 89, 152)
        layer.cornerRadius = 2
        layer.masksToBounds = true
        setTitleColor(.white, for: .normal)
        setTitle("Signup with Facebook", for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        return
    }
    
    private func setupSubViews() {
        addSubview(fbImageView)
    }
    
    private func setupConstraints() {
        fbImageView.edgesToSuperView(exclude: .trailling, width: 36, height: nil, padding: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
