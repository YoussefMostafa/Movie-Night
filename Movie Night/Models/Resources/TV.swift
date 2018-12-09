//
//  TV.swift
//  Movie Night
//
//  Created by Youssef Mostafa on 12/9/18.
//  Copyright © 2018 UsefDev. All rights reserved.
//

import Foundation

struct TV: Decodable {
    
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
        case releaseDate = "first_air_date"
        case title = "name"
        case rate = "vote_average"
    }
    
}
