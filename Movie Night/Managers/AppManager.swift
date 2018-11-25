//
//  AppManager.swift
//  Movie Night
//
//  Created by Youssef Mostafa on 11/16/18.
//  Copyright © 2018 UsefDev. All rights reserved.
//

import Foundation
import Firebase

class AppManager {
    
    // MARK: - Props
    
    var user: UserModel? {
        didSet {
            print("\nUser info has been loaded .. \n")
        }
    }
    
    enum UserDefaultsKeys: String {
        case userData = "userDataKey"
    }
    
    // MARK: - Shared Instance
    
    static let shared = AppManager()
    
    // MARK: - Singelton Initializer
    
    private init() {}
    
    // MARK: - Class Methods
    
    static func configure() {
        FirebaseManager.configure()
    }
    
    static func rootController() -> UIViewController {
        if let _ = fetchUser() {
            return MNNavigationController(rootViewController: HomeController())
        }
        return OnBoardingController()
    }
    
    // MARK: - User Session
    
    static func save(_ user: UserModel) {
        do {
            AppManager.shared.user = user
            let userData = try NSKeyedArchiver.archivedData(withRootObject: user, requiringSecureCoding: false)
            UserDefaults.standard.set(userData, forKey: AppManager.UserDefaultsKeys.userData.rawValue)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    static func fetchUser() -> UserModel? {
        guard let userData = UserDefaults.standard.data(forKey: UserDefaultsKeys.userData.rawValue) else {
            print("user not found in userDefaults!")
            return nil
        }
        
        do {
            let userInfo = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(userData) as! UserModel
            shared.user = userInfo
            return userInfo
        } catch {
            print("soemthing went wrong while unarchiving user data")
            return nil
        }
    }
    
    static func uploadUserData(_ user: UserModel, _ userImage: UIImage?, _ completionHandler: @escaping (Error?)->() ) {
        FirebaseManager.shared.uploadImage(userImage, uid: user.uid) { (imagePath, error) in
            if let error = error {
                print("\n\(error.localizedDescription)\n")
            }
            user.avatarPath = imagePath
            FirebaseManager.shared.saveUserToDatabase(user) { (error) in
                if let error = error {
                    completionHandler(error)
                    return
                }
                completionHandler(nil)
            }
        }
    }
    
    
    
}
