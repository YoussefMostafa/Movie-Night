//
//  MNFBLoginButtonDelegate.swift
//  Movie Night
//
//  Created by Youssef Mostafa on 11/17/18.
//  Copyright © 2018 UsefDev. All rights reserved.
//

import Foundation

protocol MNFBLoginButtonDelegate {
    func loginSuccessed(with userInfo: UserInfo)
    func loadingViewStartedAnimation()
    func loadingViewStopedAnimation()
}
