//
//  MNLoginController.swift
//  Movie Night
//
//  Created by Youssef Mostafa on 11/12/18.
//  Copyright © 2018 UsefDev. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class MNLoginController: MNViewController {
    
    private(set) var fbLoginButton = MNFBLoginButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fbLoginButton.delegate = self
    }
    
    override func setupUI() {
        setupFacebookButtonUI()
    }
    
    private func setupFacebookButtonUI() {
        fbLoginButton.backgroundColor = UIColor.rgb(59, 89, 152)
        fbLoginButton.layer.cornerRadius = 2
        fbLoginButton.layer.masksToBounds = true
        fbLoginButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
    }
    
}

extension MNLoginController: FBSDKLoginButtonDelegate {
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        
    }
    
    
}
