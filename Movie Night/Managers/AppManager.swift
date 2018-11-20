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
        FirebaseApp.configure()
    }
    
    // MARK: - User Session
    
    static func save(_ user: UserModel) {
        do {
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
            return userInfo
        } catch {
            print("soemthing went wrong while unarchiving user data")
            return nil
        }
    }
    
    
}
