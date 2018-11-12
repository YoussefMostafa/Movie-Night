//
//  MNFBLoginButton.swift
//  Movie Night
//
//  Created by Youssef Mostafa on 11/6/18.
//  Copyright © 2018 UsefDev. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class MNFBLoginButton: FBSDKLoginButton {
    
    private let fbImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "FaceBookIcon"))
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubViews()
        setupConstraints()
    }
    
    private func setupSubViews() {
        addSubview(fbImageView)
    }
    
    private func setupConstraints() {
        removeConstraints(constraints)
        fbImageView.edgesToSuperView(exclude: .trailling, width: 36, height: nil, padding: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
