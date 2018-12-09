//
//  MoviesListController.swift
//  Movie Night
//
//  Created by Youssef Mostafa on 12/9/18.
//  Copyright © 2018 UsefDev. All rights reserved.
//

import UIKit

class MoviesListController: MNCollectionViewController<Movie,ListCollectionViewCell<Movie>> {
    
    // MARK: - DataSource
    
    override var dataSource: [Movie]? {
        didSet {
            guard let dataSource = dataSource else { return }
            totalMovies = dataSource.count
            collectionView.reloadData()
            
        }
    }
    
    // MARK: - Props
    
    var type: CollectionType? = CollectionType.nowPlaying
    private var page = 1
    private var totalMovies = 0
    
    // MARK: - Methods
    
    override func setupUI() {
        super.setupUI()
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical
        }
    }
    
    override func fetchData() {
        guard let type = type, let endPoint = type.endPoint else {return}
        APIManager.fetchData(in: page, endPoint) { (data: MoviesRequestedPage?, error) in
            if let error = error {
                print("\n\(error.localizedDescription)\n")
                return
            }
            guard let movies = data?.movies else { return }
            self.dataSource == nil ? self.dataSource = movies : self.dataSource?.append(contentsOf: movies)
        }
    }
    
    override func setupSubViews() {
        view.addSubview(collectionView)
    }
    
    override func setupConstraints() {
        collectionView.edgesToSuperView()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let dataSource = dataSource else { return 0 }
        return dataSource.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.bounds.width - 32, height: 192)
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.item+1 == totalMovies {
            page += 1
            fetchData()
        }
    }
    
}

