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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    // MARK: - Class Methods
    
}

// MARK: - Extensions

extension MNLoginController: FBSDKLoginButtonDelegate {
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        
        if error != nil {
            print(error.localizedDescription)
            return
        }
        
        
        FBLoginManager.shared.signIn(with: result.token) { (userInfo, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
        }
        
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        
    }
    
    
}
