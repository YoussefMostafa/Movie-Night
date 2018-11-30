//
//  NowPlayingMovies.swift
//  Movie Night
//
//  Created by Youssef Mostafa on 11/27/18.
//  Copyright © 2018 UsefDev. All rights reserved.
//

import Foundation

struct NowPlayingMovies: Decodable {
    
    var page: Int
    var movies: [Movie]?
    
    enum CodingKeys: String, CodingKey {
        case page = "page"
        case movies = "results"
    }
    
}
