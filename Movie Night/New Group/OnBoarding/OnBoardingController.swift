//
//  OnBoardingController.swift
//  Movie Night
//
//  Created by Youssef Mostafa on 10/29/18.
//  Copyright © 2018 UsefDev. All rights reserved.
//

import UIKit

class OnBoardingController: MNViewController {
    
    // MARK: - Attributes
    
    var toggle = true
    var pageCellId = "PageCellId"
    
    // MARK: - DataSources
    
    var pagesDataSource: OnboardingIntroTextModel?
    
    // MARK: - Views
    
    private let backgroundImageView: UIImageView = {
        let image = UIImage(named: "OnboardingBackgroundImage")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let brightnessLayerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rgb(0, 0, 0, 0.25)
        return view
    }()
    
    private lazy var onboardingCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    
    // MARK: - Controller Methods
    
    internal override func setupSubViews() {
        // superView
        view.addSubview(backgroundImageView)
        view.addSubview(brightnessLayerView)
        view.addSubview(onboardingCollectionView)
    }
    
    internal override func setupConstraints() {
        backgroundImageView.edgesToSuperView()
        brightnessLayerView.edgesToSuperView()
        onboardingCollectionView.edgesToSuperView()
    }
    
    internal override func prepareDataSources() {
        pagesDataSource = OnboardingIntroTextModel()
    }
    
    internal override func registerCells() {
        onboardingCollectionView.register(OnBoardingPageCell.self, forCellWithReuseIdentifier: pageCellId)
    }
    
    override func setupUI() {
        onboardingCollectionView.backgroundColor = .clear
        onboardingCollectionView.isPagingEnabled = true
        if let layout = onboardingCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}


// MARK: Extensions

extension OnBoardingController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: pageCellId, for: indexPath) as! OnBoardingPageCell
        cell.introText = pagesDataSource?.introTexts[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.bounds.width, height: view.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
