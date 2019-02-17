//
//  Bindable.swift
//  Movie Night
//
//  Created by Youssef Mostafa on 2/16/19.
//  Copyright © 2019 UsefDev. All rights reserved.
//

import Foundation

class Bindable<T> {
    
    var value: T? { didSet { observer?(value) } }
    
    var observer: ((T?)->())?
    
    func bind(observer: @escaping (T?)->()) {
        self.observer = observer
    }
    
}

