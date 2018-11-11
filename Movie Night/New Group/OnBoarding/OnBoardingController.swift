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
    
    private var toggle = true
    private var pageCellId = "PageCellId"
    private var pageNo = 1
    private var lastContentOffset:  CGPoint = CGPoint(x: 0, y: 0)
    
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
    
    private let pageIndicatorView: UIPageControl = {
        let pageControl = UIPageControl(frame: .zero)
        pageControl.currentPage = 0
        pageControl.numberOfPages = 3
        return pageControl
    }()
    
    private let signUpWithMailButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Signup with Email", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        button.setTitleColor(UIColor.rgb(55, 71, 79, 1), for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 2
        return button
    }()
    
    private let fbLoginButton: UIButton = {
        let button = FBLoginButton(type: .system)
        return button
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .clear
        button.setTitle("L O G I N", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    private lazy var loginButtonsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [signUpWithMailButton, fbLoginButton, loginButton])
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
    
    
    // MARK: - Controller Methods
    
    internal override func setupSubViews() {
        // superView
        view.addSubview(backgroundImageView)
        view.addSubview(brightnessLayerView)
        view.addSubview(onboardingCollectionView)
        view.addSubview(pageIndicatorView)
        view.addSubview(loginButtonsStackView)
    }
    
    internal override func setupConstraints() {
        backgroundImageView.edgesToSuperView()
        brightnessLayerView.edgesToSuperView()
        onboardingCollectionView.edgesToSuperView()
        pageIndicatorView.centerHorizontally()
        pageIndicatorView.anchorBottom(loginButtonsStackView.safeAreaLayoutGuide.topAnchor, padding: 48)
        loginButtonsStackView.anchor(top: nil, bottom: view.safeAreaLayoutGuide.bottomAnchor, leading: view.leadingAnchor, trailling: view.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 16, bottom: 8, right: 16), width: nil, height: 124)
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
    
    override func viewDidLayoutSubviews() {
        navigationItem.title = "Popular"
        pageIndicatorView.subviews.forEach {$0.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)}
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
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let screenWidth = UIScreen.main.bounds.width
        let screenMidPoint = (screenWidth*CGFloat(pageNo)) - (screenWidth/2)
        if scrollView.contentOffset.x > screenMidPoint {
            pageNo += 1
            pageIndicatorView.currentPage = pageNo-1
        } else if scrollView.contentOffset.x < lastContentOffset.x {
            pageNo -= 1
        }
        lastContentOffset = scrollView.contentOffset
    }

}
