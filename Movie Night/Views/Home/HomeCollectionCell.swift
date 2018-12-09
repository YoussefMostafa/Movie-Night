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
            if dataSource is Movie {
                fillMovieData(dataSource as! Movie)
            } else if dataSource is TV {
                fillTvData(dataSource as! TV)
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
    
    // MARK: - LifeCycle Methods
    
    override func setupUI() {
        clipsToBounds = true
    }
    
    override func setupSubViews() {
        addSubview(contentImageView)
        addSubview(contentRate)
        addSubview(contentTitle)
    }
    
    override func setupConstraints() {
        contentImageView.edgesToSuperView(exclude: .bottom)
        
        contentRate.anchorTop(topAnchor, padding: 8)
        contentRate.anchorLeading(leadingAnchor, padding: 8)
        contentRate.set(width: 44, height: 20)
        
        contentTitle.edgesToSuperLeadingAndTrailing()
        contentTitle.anchorTop(contentImageView.bottomAnchor, padding: 8)
        contentTitle.anchorBottom(bottomAnchor, padding: 0)
        contentTitle.setHeight(40)
    }
    
    private func loadImage(_ path: String?) {
        if let path = path {
            let url = APIManager.createPhotoUrl(from: path)
            contentImageView.sd_setImage(with: url)
        }
    }
    
    private func fillMovieData(_ movie: Movie) {
        let movieViewModel = MovieViewModel(movie)
        contentRate.text = movieViewModel.contentRate
        contentTitle.text = movieViewModel.contentTitle
        loadImage(movieViewModel.posterPath)
    }
    
    private func fillTvData(_ tv: TV) {
        let tvViewModel = TVViewModel(tv)
        contentRate.text = tvViewModel.contentRate
        contentTitle.text = tvViewModel.contentTitle
        loadImage(tvViewModel.posterPath)
    }
    
    
}
