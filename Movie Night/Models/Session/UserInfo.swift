//
//  UserInfo.swift
//  Movie Night
//
//  Created by Youssef Mostafa on 11/12/18.
//  Copyright © 2018 UsefDev. All rights reserved.
//

import Foundation
import UIKit

struct UserInfo {
    
    var uid: String
    var name: String?
    var email: String?
    var profilePicture: URL?
    var phoneNumber: String?
    
    init(uid: String, name: String?, email: String?, profilePicture: URL?, phoneNumber: String?) {
        self.uid = uid
        self.name = name
        self.email = email
        self.profilePicture = profilePicture
        self.phoneNumber = phoneNumber
    }
    
}
