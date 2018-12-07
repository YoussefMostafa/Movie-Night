//
//  CellsReuseIdentifiers.swift
//  Movie Night
//
//  Created by Youssef Mostafa on 12/2/18.
//  Copyright © 2018 UsefDev. All rights reserved.
//

import Foundation

enum CellsReuseIdentifiers: String {
    
    case homeCollectionCell = "HomeCollectionCellIdentifier"
    
    var identifier: String {
        return self.rawValue
    }
}
