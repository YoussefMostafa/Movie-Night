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
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage
import UIKit


class FirebaseManager {
    
    // MARK: - Props
    
    
    var databaseRef: DatabaseReference?
    var storageRef: StorageReference?
    
    
    // Shared Instance
    
    static let shared = FirebaseManager()
    
    // Singelton Initializer
    
    private init() {}
    
    // Class Methods
    
    static func configure() {
        FirebaseApp.configure()
        FirebaseManager.shared.setFireBaseRefs()
    }
    
    private func setFireBaseRefs() {
        databaseRef = Database.database().reference()
        storageRef = Storage.storage().reference()
    }
    
    // MARK: - Login
    
    static func signin(with token: FBSDKAccessToken, _ completionHandler: @escaping (UserModel?, Error?)->())  {
        let credential = FacebookAuthProvider.credential(withAccessToken: token.tokenString)
        Auth.auth().signInAndRetrieveData(with: credential) { (authResult, error) in
            if error != nil {
                completionHandler(nil, error)
                return
            }
            completionHandler(self.getUserInfo(from: authResult!), nil)
        }
    }
    
    private static func getUserInfo(from authResults: AuthDataResult) -> UserModel {
        let user = authResults.user    
        return UserModel(uid: user.uid, name: user.displayName, email: user.email, profilePicture: user.photoURL?.absoluteString, phoneNumber: user.phoneNumber)
    }
    
    // MARK: - Database
    
    func saveUserToDatabase(_ user: UserModel, _ completionHandler: @escaping (Error?)->() ) {
        guard let databaseRef = databaseRef else { return }
        let values = getDictionaryProps(from: user)
        databaseRef.child("users/\(user.uid)").setValue(values) { (error, ref) in
            completionHandler(error)
        }
    }
    
    func uploadImage(_ image: UIImage?, uid: String, _ completionHandler: @escaping (String?, Error?)->() ) {
        
        guard let storageRef = storageRef else { return }
        guard let image = image else { return }
        guard let imageData = (UIImage.pngData(image))() else { return }
        
        let imageRef = storageRef.child("users/\(uid).png")
        imageRef.putData(imageData, metadata: nil) { (metadata, error) in
            if let error = error {
                completionHandler(nil, error)
            }
            
            imageRef.downloadURL(completion: { (url, error) in
                if let error = error {
                    completionHandler(nil, error)
                }
                completionHandler(url?.absoluteString, nil)
            })
            
        }
    }
    
    func getDictionaryProps(from user: UserModel) -> [String: String?] {
        return [
            "uid": user.uid,
            "username": user.name,
            "email": user.email,
            "phoneNumber": user.phoneNumber,
            "img": user.avatarPath
        ]
    }
    
}
