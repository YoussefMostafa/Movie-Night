//
//  CardDetailsViewController.swift
//  Movie Night
//
//  Created by Youssef Mostafa on 4/7/19.
//  Copyright © 2019 UsefDev. All rights reserved.
//

import UIKit

class CardDetailsViewController: MNViewController, UIViewControllerTransitioningDelegate {
    
    // MARK: - Props
    
    var dismissalAnimatedTransitioning: MNCardCustomDismissalAnimatedTransitioning?
    var endTransitioningFrame: CGRect?
    
    // MARK: - Views
    
    lazy var dismissButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .green
        button.addTarget(self, action: #selector(dismissalButtonHandler), for: .touchUpInside)
        return button
    }()
    
    // MARK: - LifeCycle Methods
    
    override func setupUI() {
        view.backgroundColor = .red
    }
    
    override func setupSubViews() {
        view.addSubview(dismissButton)
    }
    
    override func setupConstraints() {
        dismissButton.anchor(
            top: view.safeAreaLayoutGuide.topAnchor,
            trailing: view.trailingAnchor,
            padding: UIPadding(top: 16, right: 16),
            width: 48,
            height: 48
        )
    }
    
    override func prepareProps() {
        dismissalAnimatedTransitioning = MNCardCustomDismissalAnimatedTransitioning()
    }
    
    @objc func dismissalButtonHandler() {
        guard let dismissalAnimatedTransitioning = dismissalAnimatedTransitioning, let endFrame = endTransitioningFrame else { return }
        dismissalAnimatedTransitioning.endFrame = endFrame
        transitioningDelegate = self
        dismiss(animated: true, completion: nil)
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return dismissalAnimatedTransitioning
    }
    
    
}
