//
//  FBLoginManager.swift
//  Movie Night
//
//  Created by Youssef Mostafa on 11/11/18.
//  Copyright © 2018 UsefDev. All rights reserved.
//

import Foundation
import FBSDKLoginKit
import FirebaseAuth

class FBLoginManager {
    
    // MARK: - Singelton instance
    
    static let shared = FBLoginManager()
    
    // MARK: - Initializers
    
    private init() {}
    
    // MARK: - Methods
    
    func signIn(with token: FBSDKAccessToken, _ completionHandler: @escaping (UserInfo?, Error?)->())  {
        let credential = FacebookAuthProvider.credential(withAccessToken: token.tokenString)
        
        Auth.auth().signInAndRetrieveData(with: credential) { (authResult, error) in
            
            
            guard let error = error else {
                completionHandler(self.getUserInfo(from: authResult!), nil)
                return
            }
            
            completionHandler(nil, error)
        }
    }
    
    private func getUserInfo(from authResults: AuthDataResult) -> UserInfo {
        let user = authResults.user
        return UserInfo(uid: user.uid, name: user.displayName, email: user.email, profilePicture: user.photoURL, phoneNumber: user.phoneNumber)
    }
    
}
