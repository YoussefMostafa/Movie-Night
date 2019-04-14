//
//  MNCardCustomAnimatedTransitioning.swift
//  Movie Night
//
//  Created by Youssef Mostafa on 4/7/19.
//  Copyright © 2019 UsefDev. All rights reserved.
//

import UIKit

class MNCardCustomPresentingAnimatedTransitioning: NSObject, UIViewControllerAnimatedTransitioning {
    
    var startFrame: CGRect?
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.4
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toViewController = transitionContext.viewController(forKey: .to), let startFrame = startFrame else { return }
        let containerView = transitionContext.containerView
        let finalFrame = transitionContext.finalFrame(for: toViewController)
        containerView.addSubview(toViewController.view)
        toViewController.view.frame = startFrame

        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            toViewController.view.frame = finalFrame
        }) { (completed) in
            transitionContext.completeTransition(completed)
        }
    }
    
    
}
