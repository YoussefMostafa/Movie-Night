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
    
    private(set) lazy var loadingView: BLMultiColorLoader = {
        let view = BLMultiColorLoader()
        view.colorArray = [UIColor.white]
        view.lineWidth = 2
        addSubview(view)
        view.anchorTrailling(trailingAnchor, padding: 16)
        view.centerVertically()
        view.set(width: 20, height: 20)
        return view
    }()
    
}
