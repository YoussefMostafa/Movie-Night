//
//  TVRequestedPage.swift
//  Movie Night
//
//  Created by Youssef Mostafa on 12/9/18.
//  Copyright © 2018 UsefDev. All rights reserved.
//

import Foundation

struct TVRequestedPage: Decodable {
    
    var page: Int
    var series: [TV]?
    
    enum CodingKeys: String, CodingKey {
        case page = "page"
        case series = "results"
    }
    
}
