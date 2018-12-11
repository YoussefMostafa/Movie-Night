//
//  ListCollectionViewCell.swift
//  Movie Night
//
//  Created by Youssef Mostafa on 12/9/18.
//  Copyright © 2018 UsefDev. All rights reserved.
//

import UIKit

class ListCollectionViewCell<T>: MNCollectionViewCell<T> {
    
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
    
    private let backdropImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    private let titleBackView: UIView = {
        let view = UIView()
        view.layer.opacity = 5.5
        view.backgroundColor = UIColor.rgb(0, 0, 0, 0.6)
        view.layer.shadowColor = UIColor.rgb(0, 0, 0, 0.6).cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: -4)
        view.layer.shadowRadius = 10
        return view
    }()
    
    private let contentRate: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .center
        label.backgroundColor = UIColor.rgb(74, 74, 74, 0.9)
        label.layer.cornerRadius = 4
        label.numberOfLines = 0
        label.layer.masksToBounds = true
        return label
    }()
    
    private let contentTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.layer.opacity = 0.95
        label.backgroundColor = .clear
        label.textColor = .white
        return label
    }()
    
    // Methods
    
    override func setupUI() {
        layer.cornerRadius = 10
        clipsToBounds = true
    }
    
    override func setupSubViews() {
        addSubview(backdropImage)
        addSubview(titleBackView)
        backdropImage.addSubview(contentRate)
        titleBackView.addSubview(contentTitle)
    }
    
    override func setupConstraints() {
        backdropImage.edgesToSuperView()
        
        contentRate.anchorTop(topAnchor, padding: 16)
        contentRate.anchorTrailing(trailingAnchor, padding: 16)
        contentRate.set(width: 44, height: 20)
        
        titleBackView.edgesToSuperView(exclude: .top)
        titleBackView.setHeight(58)
        
        contentTitle.edgesToSuperView()
    }
    
    private func fillMovieData(_ movie: Movie) {
        let movieViewModel = MovieViewModel(movie)
        contentRate.text = movieViewModel.contentRate
        contentTitle.text = movieViewModel.contentTitle
        loadImage(movieViewModel.backdropPath)
    }
    
    private func fillTvData(_ tv: TV) {
        let tvViewModel = TVViewModel(tv)
        contentRate.text = tvViewModel.contentRate
        contentTitle.text = tvViewModel.contentTitle
        loadImage(tvViewModel.backdropPath)
    }
    
    private func loadImage(_ path: String?) {
        if let path = path {
            let url = APIManager.createPhotoUrl(from: path)
            backdropImage.sd_setImage(with: url)
        }
    }
    
    override func cleanup() {
        backdropImage.image = nil
        contentTitle.text = nil
        contentRate.text = nil
    }
    
}
