//
//  MovieHomeController.swift
//  Movie Night
//
//  Created by Youssef Mostafa on 11/20/18.
//  Copyright © 2018 UsefDev. All rights reserved.
//

import UIKit

class MovieHomeController: MNViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        APIManager.getNowPlayingMovies(page: 1) { (nowPlayingMovies) in
            
        }
    }
}
