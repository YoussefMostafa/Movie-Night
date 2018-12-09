//
//  MovieHomeController.swift
//  Movie Night
//
//  Created by Youssef Mostafa on 11/20/18.
//  Copyright © 2018 UsefDev. All rights reserved.
//

import UIKit

class MovieHomeController: MNViewController {
    
    // MARK: - Views
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .clear
        return scrollView
    }()
    
    private let visualEffectView: UIVisualEffectView = {
        let visualEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let view = UIVisualEffectView(effect: visualEffect)
        return view
    }()
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    // MARK: - Props
    
    private let homeBuilder = HomeBuilder()
    
    // MARK: - LifeCycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupDelegates() {
        homeBuilder.delegate = self
    }
    
    override func setupUI() {
        view.backgroundColor = .black
        scrollView.showsVerticalScrollIndicator = false
        backgroundImageView.image = #imageLiteral(resourceName: "MoviesHomeBackgroundImage")
    }
    
    override func setupSubViews() {
        view.addSubview(backgroundImageView)
        backgroundImageView.addSubview(visualEffectView)
        view.addSubview(scrollView)
    }
    
    override func setupConstraints() {
        backgroundImageView.edgesToSuperView()
        visualEffectView.edgesToSuperView()
        scrollView.edgesToSuperView(exclude: .top)
        scrollView.anchorTop(view.safeAreaLayoutGuide.topAnchor, padding: 0)
    }
    
    // MARK: - Class Methods
    
}

// MARK: - Extensions

extension MovieHomeController: HomeBuilderDelegate {
    
    func numberOfCollectionCells() -> Int {
        return 4
    }
    
    func sizeForCollectionCellAt(index: Int) -> CGSize {
        return CGSize(width: view.bounds.width, height: 297)
    }
    
    func sizeForHeader(at index: Int) -> CGSize {
        return CGSize(width: view.bounds.size.width - 32, height: 34)
    }
    
    func spaceBetweenCells() -> CGFloat {
        return 20
    }
    
    func homeBuilderDidLayoutCollectionViews(in containerView: UIView, _ contentHeight: CGFloat) {
        scrollView.addSubview(containerView)
        containerView.anchorTop(scrollView.topAnchor, padding: 0)
        containerView.anchorBottom(scrollView.bottomAnchor, padding: 0)
        containerView.set(width: view.bounds.width, height: contentHeight)
    }
    
    func headerForCollection(at index: Int) -> HomeCollectionHeaderView {
        return HomeCollectionHeaderView()
    }
    
    func typeForCollection(at index: Int) -> CollectionType? {
        switch index {
        case 0: return .nowPlaying
        case 1: return .topRated
        case 2: return .popular
        case 3: return .upcomming
        default: return nil
        }
    }
    
    
}
