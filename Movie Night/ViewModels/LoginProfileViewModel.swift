//
//  LoginProfileViewModel.swift
//  Movie Night
//
//  Created by Youssef Mostafa on 11/17/18.
//  Copyright © 2018 UsefDev. All rights reserved.
//

import Foundation

struct LoginProfileViewModel {
    
    var welcomeText: String?
    var cautionText: String?
    var username: String?
    var profilePic: URL?
    
    // MARK: - Dependancy Injection
    
    init(_ userInfo: UserModel) {
        welcomeText = "Hey \(userInfo.name ?? "")!"
        cautionText = "You’re about to continue with Facebook. Take a look at your information"
        username = userInfo.name
        prepareProfilePicUrl(userInfo.avatarPath)
    }
    
    private mutating func prepareProfilePicUrl(_ url: String?) {
        guard let url = url else { return }
        profilePic = URL(string: url + "?type=large")
    }
}
