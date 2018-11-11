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
    
//    var navigationBar: MNNavigationBar?
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
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        if hasNavigationBar { setupNavigationBar() }
    }
    
    func setupSubViews() {}
    func setupConstraints() {}
    func setupUI() {}
    func prepareDataSources() {}
    func fetchData() {}
    func registerCells() {}
    func setupDelegates() {}
    
    
//    func setupNavigationBar() {
//        let navBarFrame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 44 + view.safeAreaInsets.top)
//        let navigationBar = MNNavigationBar(frame: navBarFrame)
//        self.navigationBar = navigationBar
//        view.addSubview(navigationBar)
//    }
    
    public func x() {
        
    }
    
    
    
    
}
