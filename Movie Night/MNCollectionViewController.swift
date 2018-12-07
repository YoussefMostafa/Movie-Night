//
//  MNCollectionViewController.swift
//  Movie Night
//
//  Created by Youssef Mostafa on 12/4/18.
//  Copyright © 2018 UsefDev. All rights reserved.
//

import UIKit

class MNCollectionViewController<T, U:MNCollectionViewCell<T>>: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    // MARK: - Props
    
    private let reuseIdentifier = CellsReuseIdentifiers.homeCollectionCell.identifier
    
    // MARK: - DataSource
    
    var dataSource: [T]? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    // MARK: - Inits
    
    convenience init() {
        self.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    // MARK: - LifeCycle Methos
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        prepareProps()
        setupSubViews()
        setupConstraints()
        registerCells()
        prepareDataSources()
        setupDelegates()
        setupNavigationBar()
        addObservers()
        fetchData()
        registerCells()
    }
    
    // MARK: - Methods
    
    func prepareProps() {}
    func setupSubViews() {}
    func setupConstraints() {}
    func setupUI() {}
    func prepareDataSources() {}
    func fetchData() {}
    func setupDelegates() {}
    
    func addObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {}
    
    @objc func keyboardWillHide(_ notification: Notification) {}
    
    func setupNavigationBar() {
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: .semibold)]
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func registerCells() {
        collectionView.register(U.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    // MARK: - DataSource Methods
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! U
        cell.dataSource = dataSource?[indexPath.item]
        return cell
    }
    
    // Mark: - CollectionLayout Methods
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    // MARK: - DeInits
    
    deinit { NotificationCenter.default.removeObserver(self) }
    
}



