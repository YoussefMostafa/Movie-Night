//
//  TVViewModel.swift
//  Movie Night
//
//  Created by Youssef Mostafa on 12/9/18.
//  Copyright © 2018 UsefDev. All rights reserved.
//

import Foundation

struct TVViewModel {
    
    var contentRate: String?
    var contentTitle: String?
    var overview: String?
    var posterPath: String?
    
    // MARK: - Dependacy Injection
    
    init(_ dependancy: TV) {
        contentRate = "\(dependancy.rate ?? 0)"
        contentTitle = "\(dependancy.title ?? "")"
        overview = "\(dependancy.overview ?? "")"
        posterPath = dependancy.posterPath
    }
}
