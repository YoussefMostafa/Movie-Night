//
//  MovieViewModel.swift
//  Movie Night
//
//  Created by Youssef Mostafa on 12/7/18.
//  Copyright © 2018 UsefDev. All rights reserved.
//

import Foundation

class MovieViewModel: MNCardViewModel {

    // MARK: - Dependacy Injection
    
    init(_ dependancy: Movie) {
        super.init()
        contentRate = (dependancy.rate != nil && dependancy.rate != 0.0) ? "\(dependancy.rate!)" : nil
        contentTitle = "\(dependancy.title ?? "")"
        overview = "\(dependancy.overview ?? "")"
        posterPath = dependancy.posterPath
        backdropPath = dependancy.backdropPath
    }
}
