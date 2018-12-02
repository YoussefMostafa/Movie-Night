//
//  HomeCollectionController.swift
//  Movie Night
//
//  Created by Youssef Mostafa on 11/30/18.
//  Copyright © 2018 UsefDev. All rights reserved.
//

import UIKit

class HomeCollectionController: MNViewController {
    
    // MARK: - Views
    
    fileprivate lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.delegate = self
        (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.scrollDirection = .horizontal
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    // MARK: - LifeCycle Methods
    
    override func fetchData() {
        APIManager.fetchData(endPoint: .nowPlayingMovies) { (data: NowPlayingMovies?, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let movies = data?.movies else { return }
            self.moviesDidLoad(movies)
        }
    }
    
    override func setupSubViews() {
        view.addSubview(collectionView)
    }
    
    override func setupConstraints() {
        collectionView.edgesToSuperView()
    }
    
    override func registerCells() {
        collectionView.register(HomeCollectionCell.self, forCellWithReuseIdentifier: CellsReuseIdentifiers.homeCollectionCell.identifier())
    }
    
    // MARK: - Methods
    
    private func moviesDidLoad(_ movies: [Movie]) {
        
        collectionView.dataSource = MNCollectionViewDataSource.make(for: movies)
    }
    
    
}


// MARK: - UICollectionView and FlowLayout Delegates Extension

extension HomeCollectionController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 411)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
}

// MARK: - UICollectionView DataSource Delegate Extension

extension MNCollectionViewDataSource where Model == Movie {
    
    static func make(for movies: [Movie]) -> UICollectionViewDataSource {
        return MNCollectionViewDataSource(
            cellIdentifier: CellsReuseIdentifiers.homeCollectionCell.identifier(),
            models: movies) { (cell, movie) in
            (cell as! HomeCollectionCell).dataSource = movie
        }
    }
    
}

