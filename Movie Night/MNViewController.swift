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
        registerCells()
        fetchData()
        prepareDataSources()
        setupDelegates()
        setupNavigationBar()
        addObservers()
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
    
    
    func addObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        
    }
    
    func setupNavigationBar() {
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: .semibold)]
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
}
