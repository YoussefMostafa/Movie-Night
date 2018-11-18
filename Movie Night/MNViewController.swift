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
        setupUI()
        prepareProps()
        setupSubViews()
        setupConstraints()
        prepareDataSources()
        registerCells()
        setupDelegates()
        fetchData()
        setupNavigationBar()
    }
    
    // MARK: - Class Methods
    
    func prepareProps() {}
    func setupSubViews() {}
    func setupConstraints() {}
    func setupUI() {}
    func prepareDataSources() {}
    func fetchData() {}
    func registerCells() {}
    func setupDelegates() {}
    
    
    func setupNavigationBar() {
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: .semibold)]
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}
