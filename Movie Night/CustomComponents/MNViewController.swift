//
//  MNViewController.swift
//  Movie Night
//
//  Created by Youssef Mostafa on 11/4/18.
//  Copyright © 2018 UsefDev. All rights reserved.
//

import UIKit

class MNViewController: UIViewController {
    
    // MARK: - Views

    var hasNavigationBar: Bool = false
    
    // MARK: - LifeCycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubViews()
        setupConstraints()
        setupUI()
        prepareDataSources()
        registerCells()
        setupDelegates()
        fetchData()
    }
    
    // MARK: - Methods
    
    func setupSubViews() {}
    func setupConstraints() {}
    func setupUI() {}
    func prepareDataSources() {}
    func fetchData() {}
    func registerCells() {}
    func setupDelegates() {}
    
}
