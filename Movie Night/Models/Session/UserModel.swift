//
//  UserModel.swift
//  Movie Night
//
//  Created by Youssef Mostafa on 11/12/18.
//  Copyright © 2018 UsefDev. All rights reserved.
//

import Foundation
import FirebaseDatabase

class UserModel: NSObject, NSCoding {
    
    var uid: String
    var name: String?
    var email: String?
    var avatarPath: String?
    var phoneNumber: String?
    
    private enum CodingKeys: String {
        case uid = "uid"
        case name = "name"
        case email = "email"
        case profilePicture = "profilePicture"
        case phoneNumber = "phoneNumber"
    }
    
    init(uid: String, name: String?, email: String?, profilePicture: String?, phoneNumber: String?) {
        self.uid = uid
        self.name = name
        self.email = email
        self.avatarPath = profilePicture
        self.phoneNumber = phoneNumber
    }
    
    convenience init(_ snapShot: DataSnapshot) {
        let data = snapShot.value as! Dictionary<String, String>
        self.init(uid: data["uid"]!, name: data["username"], email: data["email"], profilePicture: data["img"], phoneNumber: data["phoneNumber"])
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.uid = aDecoder.decodeObject(forKey: CodingKeys.uid.rawValue) as! String
        self.name = aDecoder.decodeObject(forKey: CodingKeys.name.rawValue) as? String
        self.email = aDecoder.decodeObject(forKey: CodingKeys.email.rawValue) as? String
        self.avatarPath = aDecoder.decodeObject(forKey: CodingKeys.profilePicture.rawValue) as? String
        self.phoneNumber = aDecoder.decodeObject(forKey: CodingKeys.phoneNumber.rawValue) as? String
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(uid, forKey: CodingKeys.uid.rawValue)
        aCoder.encode(name, forKey: CodingKeys.name.rawValue)
        aCoder.encode(email, forKey: CodingKeys.email.rawValue)
        aCoder.encode(avatarPath, forKey: CodingKeys.profilePicture.rawValue)
        aCoder.encode(phoneNumber, forKey: CodingKeys.phoneNumber.rawValue)
    }
    
    
}
