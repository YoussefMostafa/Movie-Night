//
//  HomeBuilder.swift
//  Movie Night
//
//  Created by Youssef Mostafa on 11/30/18.
//  Copyright © 2018 UsefDev. All rights reserved.
//

import UIKit

class HomeBuilder {
    
    // MARK: - Props
    
    private var cellsTotalHeight: CGFloat = 0
    
    private var collectionCells: [HomeCollectionCellView]? {
        willSet {
            if let collectionViews = newValue {
                layout(collectionViews, In: UIView())
            }
        }
    }
    
    var delegate: HomeBuilderDelegate? {
        didSet {
            startBuilding()
        }
    }
    
    // MARK: - Initializer
    
    init() {}
    
    // MARK: - Class Methods
    
    private func startBuilding() {
        guard let delegate = delegate else { return }
        collectionCells = buildViews(numberOfViews: delegate.numberOfCollectionCells())
    }
    
    private func buildViews(numberOfViews: Int) -> [HomeCollectionCellView] {
        var views = [HomeCollectionCellView]()
        for _ in 0..<numberOfViews {
            views.append(HomeCollectionCellView())
        }
        return views
    }
    
    private func layout(_ collectionViews: [HomeCollectionCellView], In view: UIView) {
        guard let delegate = delegate else { return }
        for index in collectionViews.enumerated() {
            let collectionView = index.element
            if view.subviews.last == nil {
                view.addSubview(collectionView)
                collectionView.anchorTop(view.topAnchor, padding: 0)
                let size = delegate.sizeForCollectionCellAt(index: index.offset)
                cellsTotalHeight += size.height
                collectionView.set(width: size.width, height: size.height)
                continue
            }
            guard let lastView = view.subviews.last else { return }
            view.addSubview(collectionView)
            collectionView.anchorTop(lastView.bottomAnchor, padding: delegate.spaceBetweenCells())
            let size = delegate.sizeForCollectionCellAt(index: index.offset)
            cellsTotalHeight += size.height
            collectionView.set(width: size.width, height: size.height)
        }
        delegate.homeBuilderDidLayoutCollectionViews(in: view, contentHeight())
    }
    
    private func contentHeight() -> CGFloat {
        guard let delegate = delegate else { return 0 }
        let totalHeight = cellsTotalHeight + (
            delegate.spaceBetweenCells() * CGFloat(delegate.numberOfCollectionCells()-1)
        )
        return totalHeight
    }
    
}
