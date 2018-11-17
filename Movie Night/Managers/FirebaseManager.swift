//
//  FirebaseManager.swift
//  Movie Night
//
//  Created by Youssef Mostafa on 11/16/18.
//  Copyright © 2018 UsefDev. All rights reserved.
//

import Foundation
import Firebase
import FBSDKLoginKit

class FirebaseManager {
    
    // Shared Instance
    
    static let shared = FirebaseManager()
    
    // Singelton Initializer
    
    private init() {}
    
    // Class Methods
    
    static func configure() {
        FirebaseApp.configure()
    }
    
    static func signin(with token: FBSDKAccessToken, _ completionHandler: @escaping (UserInfo?, Error?)->())  {
        let credential = FacebookAuthProvider.credential(withAccessToken: token.tokenString)
        Auth.auth().signInAndRetrieveData(with: credential) { (authResult, error) in
            if error != nil {
                completionHandler(nil, error)
                return
            }
            completionHandler(self.getUserInfo(from: authResult!), nil)
        }
    }
    
    private static func getUserInfo(from authResults: AuthDataResult) -> UserInfo {
        let user = authResults.user
        
        print("ddd")
        print(user.email)
        
        
        return UserInfo(uid: user.uid, name: user.displayName, email: user.email, profilePicture: user.photoURL, phoneNumber: user.phoneNumber)
    }
    
}
