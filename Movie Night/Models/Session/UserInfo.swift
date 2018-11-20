//
//  UserModel.swift
//  Movie Night
//
//  Created by Youssef Mostafa on 11/12/18.
//  Copyright © 2018 UsefDev. All rights reserved.
//

import Foundation

class UserModel: NSObject, NSCoding {
    
    var uid: String
    var name: String?
    var email: String?
    var profilePicture: URL?
    var phoneNumber: String?
    
    private enum CodingKeys: String {
        case uid = "uid"
        case name = "name"
        case email = "email"
        case profilePicture = "pPicture"
        case phoneNumber = "pNumber"
    }
    
    init(uid: String, name: String?, email: String?, profilePicture: URL?, phoneNumber: String?) {
        self.uid = uid
        self.name = name
        self.email = email
        self.profilePicture = profilePicture
        self.phoneNumber = phoneNumber
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.uid = aDecoder.decodeObject(forKey: CodingKeys.uid.rawValue) as! String
        self.name = aDecoder.decodeObject(forKey: CodingKeys.name.rawValue) as? String
        self.email = aDecoder.decodeObject(forKey: CodingKeys.email.rawValue) as? String
        self.profilePicture = aDecoder.decodeObject(forKey: CodingKeys.profilePicture.rawValue) as? URL
        self.phoneNumber = aDecoder.decodeObject(forKey: CodingKeys.phoneNumber.rawValue) as? String
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(uid, forKey: CodingKeys.uid.rawValue)
        aCoder.encode(name, forKey: CodingKeys.name.rawValue)
        aCoder.encode(email, forKey: CodingKeys.email.rawValue)
        aCoder.encode(profilePicture, forKey: CodingKeys.profilePicture.rawValue)
        aCoder.encode(phoneNumber, forKey: CodingKeys.phoneNumber.rawValue)
    }
    
}
