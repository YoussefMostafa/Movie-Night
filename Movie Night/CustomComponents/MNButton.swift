//
//  MNButton.swift
//  Movie Night
//
//  Created by Youssef Mostafa on 11/16/18.
//  Copyright © 2018 UsefDev. All rights reserved.
//

import UIKit
import Foundation

class MNButton: UIButton {
    
    private lazy var loadingView: BLMultiColorLoader = {
        let view = BLMultiColorLoader()
        view.colorArray = [UIColor.white]
        view.lineWidth = 2
        addSubview(view)
        view.anchorTrailing(trailingAnchor, padding: 16)
        view.centerVertically()
        view.set(width: 20, height: 20)
        return view
    }()
    
    func startAnimation() {
        layer.opacity = 0.5
        loadingView.startAnimation()
        isEnabled = false
    }
    
    func stopAnimation() {
        layer.opacity = 1
        loadingView.stopAnimation()
        isEnabled = true
    }
    
}
