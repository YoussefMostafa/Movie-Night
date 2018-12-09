//
//  MovieViewModel.swift
//  Movie Night
//
//  Created by Youssef Mostafa on 12/7/18.
//  Copyright © 2018 UsefDev. All rights reserved.
//

import Foundation

struct MovieViewModel {
    
    var contentRate: String?
    var contentTitle: String?
    var overview: String?
    var posterPath: String?
    var backdropPath: String?
    
    // MARK: - Dependacy Injection
    
    init(_ dependancy: Movie) {
        contentRate = "\(dependancy.rate ?? 0)"
        contentTitle = "\(dependancy.title ?? "")"
        overview = "\(dependancy.overview ?? "")"
        posterPath = dependancy.posterPath
        backdropPath = dependancy.backdropPath
    }
}
