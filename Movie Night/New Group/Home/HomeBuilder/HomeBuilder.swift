//
//  HomeBuilder.swift
//  Movie Night
//
//  Created by Youssef Mostafa on 11/30/18.
//  Copyright © 2018 UsefDev. All rights reserved.
//

import UIKit

class HomeBuilder<T: UICollectionViewController> {
    
    // MARK: - Props
    
    private var cellsTotalHeight: CGFloat = 0
    
    private var collectionCells: [T]? {
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
    
    private func buildViews(numberOfViews: Int) -> [T] {
        var views = [T]()
        
        for _ in 0..<numberOfViews {
            views.append(T())
        }
        return views
    }
    
    private func layout(_ collectionViews: [T], In view: UIView) {
        guard let delegate = delegate else { return }
        for index in collectionViews.enumerated() {
            let variableAnchor = view.subviews.last?.bottomAnchor ?? view.topAnchor
            let collectionController = index.element
            let size = delegate.sizeForCollectionCellAt(index: index.offset)
            let headerSize = delegate.sizeForHeader(at: index.offset)
            let header = delegate.headerForCollection(at: index.offset)
            header.type = delegate.typeForCollection(at: index.offset)
            setupControllerType(delegate.typeForCollection(at: index.offset), collectionController)
            addChild(controller: index.element)
            addSubView(to: view, views: header, collectionController.view)
            cellsTotalHeight += (size.height+headerSize.height)
            header.anchorTop(variableAnchor, padding: delegate.spaceBetweenCells())
            header.centerHorizontally()
            header.set(width: headerSize.width, height: headerSize.height)
            collectionController.view.set(width: size.width, height: size.height)
            collectionController.view.anchorTop(header.bottomAnchor, padding: 0)
        }
        delegate.homeBuilderDidLayoutCollectionViews(in: view, contentHeight())
    }
    
    private func addSubView(to superView: UIView, views: UIView...) {
        for view in views {
            superView.addSubview(view)
        }
    }
    
    private func contentHeight() -> CGFloat {
        guard let delegate = delegate else { return 0 }
        let totalHeight = cellsTotalHeight
        return totalHeight + (CGFloat(delegate.numberOfCollectionCells()) * delegate.spaceBetweenCells())
    }
    
    private func addChild(controller: T) {
        guard let delegate = delegate else { return }
        let parent = (delegate as? UIViewController)
        parent?.addChild(controller)
        controller.didMove(toParent: parent)
    }
    
    private func setupControllerType(_ type: CollectionType?, _ controller: T) {
        guard let type = type else { return }
        if controller is MoviesHomeCollectionController {
            let controller = controller as! MoviesHomeCollectionController
            controller.type = type
        } else if controller is TVHomeCollectionController {
            let controller = controller as! TVHomeCollectionController
            controller.type = type
        }
    }
    
}
