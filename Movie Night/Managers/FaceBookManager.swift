//
//  FaceBookManager.swift.swift
//  Movie Night
//
//  Created by Youssef Mostafa on 11/11/18.
//  Copyright © 2018 UsefDev. All rights reserved.
//

import Foundation
import FBSDKLoginKit
import FirebaseAuth

class FaceBookManager {
    
    // MARK: - Singelton instance
    
    static let shared = FaceBookManager()
    
    // MARK: - Attributes
    
    var accessToken: FBSDKAccessToken {
        return FBSDKAccessToken.current()
    }
    
    var credential: AuthCredential {
        return FacebookAuthProvider.credential(withAccessToken: accessToken.tokenString)
    }
    
    // MARK: - Initializers
    
    private init() {}
    
    // MARK: - Methods
    
    static func login(_ controller: UIViewController, _ completionHandler: @escaping (UserModel?, Error?)->()) {
        let loginManager = FBSDKLoginManager()
        loginManager.logIn(withReadPermissions: ["email"], from: controller) { (results, error) in
            
            if error != nil {
                completionHandler(nil, error)
                return
            }
            
            guard let results = results else { return }
            
            if results.isCancelled {
                completionHandler(nil, error)
                return
            }
            
            signInUsingFireBase({ (userInfo, error) in
                completionHandler(userInfo, error)
            })
        }
    }
    
    private static func signInUsingFireBase(_ completionHandler: @escaping (UserModel?, Error?) -> () ) {
        FirebaseManager.signin(with: shared.accessToken, { (userInfo, error) in
            if let error = error {
                print(error.localizedDescription)
                completionHandler(nil, error)
                return
            }
            guard let userInfo = userInfo else { return }
            completionHandler(userInfo, nil)
        })
    }
    
    
}
