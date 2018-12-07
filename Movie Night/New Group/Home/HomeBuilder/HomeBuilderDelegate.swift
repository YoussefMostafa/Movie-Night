//
//  HomeBuilderDelegate.swift
//  Movie Night
//
//  Created by Youssef Mostafa on 11/30/18.
//  Copyright © 2018 UsefDev. All rights reserved.
//

import Foundation

protocol HomeBuilderDelegate {
    func numberOfCollectionCells() -> Int
    func sizeForCollectionCellAt(index: Int) -> CGSize
    func spaceBetweenCells() -> CGFloat
    func homeBuilderDidLayoutCollectionViews(in containerView: UIView, _ contentHeight: CGFloat)
    func headerForCollection(at index: Int) -> HomeCollectionHeaderView
    func sizeForHeader(at index: Int) -> CGSize
}
