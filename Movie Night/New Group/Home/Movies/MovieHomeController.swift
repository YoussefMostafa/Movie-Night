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
    }
    
    override func setupSubViews() {
        view.addSubview(backgroundImageView)
        view.addSubview(scrollView)
    }
    
    override func setupConstraints() {
        backgroundImageView.edgesToSuperView()
        scrollView.edgesToSuperView(exclude: .top)
        scrollView.anchorTop(view.safeAreaLayoutGuide.topAnchor, padding: 0)
    }
    
    // MARK: - Class Methods
    
}

// MARK: - Extensions

extension MovieHomeController: HomeBuilderDelegate {
    
    func numberOfCollectionCells() -> Int {
        return 1
    }
    
    func sizeForCollectionCellAt(index: Int) -> CGSize {
        return CGSize(width: view.bounds.width, height: 471)
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
    
}
