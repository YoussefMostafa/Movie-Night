//
//  Movie.swift
//  Movie Night
//
//  Created by Youssef Mostafa on 11/27/18.
//  Copyright © 2018 UsefDev. All rights reserved.
//

import Foundation

struct Movie: Codable {
    
    var id: Int
    var posterPath: String?
    var backdropPath: String?
    var overview: String?
    var releaseDate: String?
    var title: String?
    var rate: CGFloat?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case overview = "overview"
        case releaseDate = "release_date"
        case title = "title"
        case rate = "vote_average"
    }
    
}
