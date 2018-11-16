//
//  MNFBLoginButton.swift
//  Movie Night
//
//  Created by Youssef Mostafa on 11/6/18.
//  Copyright © 2018 UsefDev. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit

class MNFBLoginButton: UIButton {
    
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
        titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        layer.masksToBounds = true
        titleLabel?.textColor = .white
        setTitle("Signup with Facebook", for: .normal)
    }
    
    private func setupSubViews() {
        addSubview(fbImageView)
    }
    
    private func setupConstraints() {
        fbImageView.edgesToSuperView(exclude: .trailing, width: 36, height: nil, padding: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
