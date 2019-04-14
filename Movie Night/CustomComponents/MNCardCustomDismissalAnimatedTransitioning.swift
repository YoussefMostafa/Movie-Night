//
//  MNCardCustomDismissalAnimatedTransitioning.swift
//  Movie Night
//
//  Created by Youssef Mostafa on 4/8/19.
//  Copyright © 2019 UsefDev. All rights reserved.
//

import UIKit

class MNCardCustomDismissalAnimatedTransitioning: NSObject, UIViewControllerAnimatedTransitioning {
    
    var endFrame: CGRect?
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.4
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let endFrame = endFrame, let fromViewController = transitionContext.viewController(forKey: .from) else { return }
        let containerView = transitionContext.containerView
        containerView.addSubview(fromViewController.view)
        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            fromViewController.view.frame = endFrame
            
        }) { (completed) in
            transitionContext.completeTransition(completed)
        }
    }
    
    
}
