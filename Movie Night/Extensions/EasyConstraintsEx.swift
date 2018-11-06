
//  EasyConstraintsEx.swift
//  Movie Night
//
//  Created by Youssef Mostafa on 10/29/18.
//  Copyright © 2018 UsefDev. All rights reserved.
//

import UIKit

extension UIView {
    
    typealias YAnchor = NSLayoutYAxisAnchor
    typealias XAnchor = NSLayoutXAxisAnchor
    
    enum AnchorType {
        case top
        case bottom
        case leading
        case trailling
    }

    func edgesToSuperView(safeAreas: Bool = false, padding: UIEdgeInsets? = nil) {
        let view = self
        guard let superView = view.superview else { return }
        
        if safeAreas {
            anchor(top: superView.safeAreaLayoutGuide.topAnchor, bottom: superView.safeAreaLayoutGuide.bottomAnchor, leading: superView.safeAreaLayoutGuide.leadingAnchor, trailling: superView.safeAreaLayoutGuide.trailingAnchor, padding: padding)
            return
        }
        anchor(top: superView.topAnchor, bottom: superView.bottomAnchor, leading: superView.leadingAnchor, trailling: superView.trailingAnchor, padding: padding)
    }
    
    func anchor(top: YAnchor?, bottom: YAnchor?, leading: XAnchor?, trailling: XAnchor?, padding: UIEdgeInsets?, width: CGFloat? = nil, height: CGFloat? = nil) {
        
        let view = self
        
        turnAutoresizingMaskIntoConstraintsOff()
        
        if let top = top {
            view.topAnchor.constraint(equalTo: top, constant: padding?.top ?? 0).isActive = true

        }
        
        if let bottom = bottom {
            view.bottomAnchor.constraint(equalTo: bottom, constant:  -(padding?.bottom ?? 0)).isActive = true
        }
        
        if let leading = leading {
            view.leadingAnchor.constraint(equalTo: leading, constant: padding?.left ?? 0).isActive = true
        }
        
        if let trailling = trailling {
            view.trailingAnchor.constraint(equalTo: trailling, constant: -(padding?.right ?? 0)).isActive = true
        }
        
        if let width = width {
            setWidth(width)
        }
        
        if let height = height {
            setHeight(height)
        }
    }
    
    func edgesToSuperView(exclude anchorType: AnchorType, width: CGFloat? = nil, height: CGFloat? = nil, padding: CGFloat = 0) {
        guard let superview = self.superview else { return }
        let padding = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        switch anchorType {
        case .top:
            anchor(top: nil, bottom: superview.bottomAnchor, leading: superview.leadingAnchor, trailling: superview.trailingAnchor, padding: padding, width: width, height: height)
        case .bottom:
            anchor(top: superview.topAnchor, bottom: nil, leading: superview.leadingAnchor, trailling: superview.trailingAnchor, padding: padding, width: width, height: height)
        case .leading:
            anchor(top: superview.topAnchor, bottom: superview.bottomAnchor, leading: nil, trailling: superview.trailingAnchor, padding: padding, width: width, height: height)
        case .trailling:
            anchor(top: superview.topAnchor, bottom: superview.bottomAnchor, leading: superview.leadingAnchor, trailling: nil, padding: padding, width: width, height: height)
        }
    }
    
    func anchorBottom(_ anchor: YAnchor, padding: CGFloat) {
        turnAutoresizingMaskIntoConstraintsOff()
        self.bottomAnchor.constraint(equalTo: anchor, constant: -padding).isActive = true
    }
    
    func anchorTop(_ anchor: YAnchor, padding: CGFloat) {
        turnAutoresizingMaskIntoConstraintsOff()
        self.topAnchor.constraint(equalTo: anchor, constant: padding).isActive = true
    }
    
    func anchorLeading(_ anchor: XAnchor, padding: CGFloat) {
        turnAutoresizingMaskIntoConstraintsOff()
        self.leadingAnchor.constraint(equalTo: anchor, constant: padding).isActive = true
    }
    
    func anchorTrailling(_ anchor: XAnchor, padding: CGFloat) {
        turnAutoresizingMaskIntoConstraintsOff()
        self.trailingAnchor.constraint(equalTo: anchor, constant: -padding).isActive = true
    }
    
    func setWidth(_ width: CGFloat) {
        turnAutoresizingMaskIntoConstraintsOff()
        self.widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    func setHeight(_ height: CGFloat) {
        turnAutoresizingMaskIntoConstraintsOff()
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    func centerInSuperView(width: CGFloat? = nil, height: CGFloat? = nil) {
        let view = self
        if let width = width { setWidth(width) }
        if let height = height { setHeight(height) }
        view.centerHorizontally()
        view.centerVertically()
    }
    
    func centerHorizontally(constant: CGFloat = 0) {
        turnAutoresizingMaskIntoConstraintsOff()
        guard let superView = self.superview else { return }
        self.centerXAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.centerXAnchor, constant: constant).isActive = true
    }
    
    func centerVertically(constant: CGFloat = 0) {
        turnAutoresizingMaskIntoConstraintsOff()
        guard let superView = self.superview else { return }
        self.centerYAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.centerYAnchor, constant: constant).isActive = true
    }
    
    func set(width: CGFloat, height: CGFloat) {
        setWidth(width)
        setHeight(height)
    }
    
    func turnAutoresizingMaskIntoConstraintsOff() {
        if translatesAutoresizingMaskIntoConstraints { translatesAutoresizingMaskIntoConstraints = false }
    }
    
}
