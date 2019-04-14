//
//  MoviesHomeCollectionController.swift
//  Movie Night
//
//  Created by Youssef Mostafa on 11/30/18.
//  Copyright © 2018 UsefDev. All rights reserved.
//

import UIKit

class HomeCollectionController: MNCollectionViewController<MNCardViewModel,HomeCollectionCell<MNCardViewModel>>, UIViewControllerTransitioningDelegate {
    
    // MARK: - Props
    
    var type: CollectionType?
    var animatedTransitioning: MNCardCustomPresentingAnimatedTransitioning?
    
    // MARK: - Methods
    
    override func setupUI() {
        super.setupUI()
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
    }
    
    override func fetchData() {
        guard let type = type, let endPoint = type.endPoint else {return}
        switch type {
        case .popularMovies, .nowPlaying, .topRatedMovies, .upcomming:
            fetchMovies(endPoint: endPoint)
        case .airingToday, .onTv, .popularOnTV, .topRatedOnTV:
            fetchTvSeries(endPoint: endPoint)
        }
    }
    
    override func prepareProps() {
        animatedTransitioning = MNCardCustomPresentingAnimatedTransitioning()
    }
    
    // TODO:- refactor duplication in this two methods
    
    private func fetchMovies(endPoint: APIManager.EndPoints) {
        APIManager.fetchData(endPoint) { (data: MoviesRequestedPage?, error) in
            if let error = error {
                print("\n\(error.localizedDescription)\n")
                return
            }
            guard let movies = data?.movies else { return }
            let movieViewModels = movies.map({ (movie) -> MovieViewModel in
                return MovieViewModel(movie)
            })
            self.dataSource = movieViewModels
        }
    }
    
    private func fetchTvSeries(endPoint: APIManager.EndPoints) {
        APIManager.fetchData(endPoint) { (data: TVRequestedPage?, error) in
            if let error = error {
                print("\n\(error.localizedDescription)\n")
                return
            }
            guard let tvSeries = data?.series else { return }
            let tvSeriesViewModels = tvSeries.map({ (tv) -> TVViewModel in
                return TVViewModel(tv)
            })
            self.dataSource = tvSeriesViewModels
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
        return dataSource.count >= 20 ? 20 : dataSource.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 140, height: 249)
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = CardDetailsViewController()
        controller.transitioningDelegate = self
        
        guard
            let animatedTransitioning = animatedTransitioning ,
            var frame = collectionView.layoutAttributesForItem(at: indexPath)?.frame
            else { return }
        
        let screenWidth = UIScreen.main.bounds.width
        let contentOffset = collectionView.contentOffset.x > 0 ? collectionView.contentOffset.x + screenWidth : collectionView.contentOffset.x
        let screenOffset = Int(contentOffset/screenWidth)
        let realisticX = frame.minX - (CGFloat(screenOffset) * screenWidth)
        
        frame = CGRect(x: frame.minX, y: frame.minY * -1, width: frame.width, height: frame.height-40)
        
//        print("screenOffset: \(screenOffset)")
        print("content offset: \(collectionView.contentOffset)")
//        print("frame \(frame.minX)")
//        print("realisticX \(realisticX)")
        
//        print("cv: \(collectionView.convert(frame, from: collectionView))")
//        print("sp: \(collectionView.convert(frame, from: collectionView.superview))")
//        print("bv: \(collectionView.convert(frame, from: collectionView.backgroundView))")

        
        animatedTransitioning.startFrame = frame
        controller.endTransitioningFrame = frame
//        present(controller, animated: true, completion: nil)
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return animatedTransitioning
    }
    
}
