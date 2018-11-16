//
//  MNViewController.swift
//  Movie Night
//
//  Created by Youssef Mostafa on 11/4/18.
//  Copyright © 2018 UsefDev. All rights reserved.
//

import UIKit

class MNViewController: UIViewController {
    
    // MARK: - LifeCycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareProps()
        setupSubViews()
        setupConstraints()
        setupUI()
        prepareDataSources()
        registerCells()
        setupDelegates()
        fetchData()
    }
    
    // MARK: - Methods
    
    func prepareProps() {}
    func setupSubViews() {}
    func setupConstraints() {}
    func setupUI() {}
    func prepareDataSources() {}
    func fetchData() {}
    func registerCells() {}
    func setupDelegates() {}
    
}
