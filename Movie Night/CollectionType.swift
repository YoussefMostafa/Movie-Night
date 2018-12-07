//
//  CollectionType.swift
//  Movie Night
//
//  Created by Youssef Mostafa on 12/7/18.
//  Copyright © 2018 UsefDev. All rights reserved.
//

import Foundation

enum CollectionType {
    
    case nowPlaying
    case topRated
    case popular
    case upcomming
    
    var title: String {
        switch self {
        case .nowPlaying: return "Now Playing"
        case .popular: return "Popular"
        case .topRated: return "Top Rated"
        case .upcomming: return "Upcoming"
        }
    }
    
}
