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
    case topRatedMovies
    case popularMovies
    case upcomming
    case onTv
    case airingToday
    case popularOnTV
    case topRatedOnTV
    
    var title: String {
        switch self {
        case .nowPlaying: return "Now Playing"
        case .popularMovies: return "Popular"
        case .topRatedMovies: return "Top Rated"
        case .upcomming: return "Upcoming"
        case .onTv: return "OnTV"
        case .airingToday: return "Airing Today"
        case .popularOnTV: return "Popular"
        case .topRatedOnTV: return "Top Rated"
        }
    }
    
    var endPoint: APIManager.EndPoints? {
        switch self {
        case .nowPlaying: return .nowPlayingMovies
        case .popularMovies: return  .popularMovies
        case .topRatedMovies: return .topRatedMovies
        case .upcomming: return .upcomming
        case .airingToday: return .airingToday
        case .onTv: return .onTv
        case .popularOnTV: return .popularOnTV
        case .topRatedOnTV: return .topRatedOnTV
        }
    }
    
}
