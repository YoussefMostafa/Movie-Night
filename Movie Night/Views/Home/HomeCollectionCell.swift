//
//  HomeCollectionCell.swift
//  Movie Night
//
//  Created by Youssef Mostafa on 11/30/18.
//  Copyright © 2018 UsefDev. All rights reserved.
//

import UIKit

class HomeCollectionCell<T>: MNCollectionViewCell<T> {
    
    // MARK: - DataSource
    
    override var dataSource: T? {
        didSet {
            guard let dataSource = dataSource else { return }
            if let dataSource = dataSource as? MNCardViewModel {
                contentRate.text = dataSource.contentRate
                contentRate.isHidden =  contentRate.text == nil ? true : false
                contentTitle.text = dataSource.contentTitle
                contentImageView.sd_setImage(with: APIManager.createPhotoUrl(from: dataSource.posterPath, with: .high))
            }
        }
    }
    
    // MARK: - Views
    
    private let contentImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 4
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let contentRate: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .center
        label.backgroundColor = UIColor.rgb(74, 74, 74, 0.9)
        label.layer.cornerRadius = 4
        label.layer.masksToBounds = true
        return label
    }()
    
    private let contentTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.layer.opacity = 0.95
        label.backgroundColor = .clear
        label.textColor = .white
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let visualEffectView: UIVisualEffectView = {
        let effect = UIBlurEffect(style: .regular)
        let visualEffectView = UIVisualEffectView(effect: effect)
        return visualEffectView
    }()
    
    // MARK: - LifeCycle Methods
    
    override func setupUI() {
        clipsToBounds = true
    }
    
    override func setupSubViews() {
        addSubview(visualEffectView)
        addSubview(contentImageView)
        addSubview(contentRate)
        addSubview(contentTitle)
    }
    
    override func setupConstraints() {
        visualEffectView.anchor(top: contentImageView.topAnchor, bottom: contentImageView.bottomAnchor, leading: contentImageView.leadingAnchor, trailing: contentImageView.trailingAnchor)
        
        contentImageView.edgesToSuperView(exclude: .bottom)
        
        contentRate.anchorTop(topAnchor, padding: 8)
        contentRate.anchorLeading(leadingAnchor, padding: 8)
        contentRate.set(width: 44, height: 20)
        
        contentTitle.edgesToSuperLeadingAndTrailing()
        contentTitle.anchorTop(contentImageView.bottomAnchor, padding: 8)
        contentTitle.anchorBottom(bottomAnchor, padding: 0)
        contentTitle.setHeight(40)
    }
    
    override func cleanup() {
        contentRate.text = nil
        contentImageView.image = nil
        contentTitle.text = nil
    }
    
}
