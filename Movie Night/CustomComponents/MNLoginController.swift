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
    
    // MARK: - Views
    
    var fbLoginButton: MNFBLoginButton  {
        let button = MNFBLoginButton(type: .system)
        button.delegate = self
        button.backgroundColor = UIColor.rgb(59, 89, 152)
        button.layer.cornerRadius = 2
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        button.layer.masksToBounds = true
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        return button
    }
    
    var signUpWithMailButton: UIButton {
        let button = UIButton(type: .system)
        button.setTitle("Signup with Email", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        button.setTitleColor(UIColor.rgb(55, 71, 79, 1), for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 2
        return button
    }
    
    // MARK: - LifeCycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Class Methods
    
}

// MARK: - Extensions

extension MNLoginController: FBSDKLoginButtonDelegate {
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        
    }
    
    
}
