
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
        case trailing
    }

    func edgesToSuperView(safeArea: Bool? = nil, padding: UIPadding? = nil) {
        guard let superView = self.superview else { return }
        let safeArea = safeArea ?? false
            anchor(
                top: safeArea ? superView.safeAreaLayoutGuide.topAnchor : superView.topAnchor,
                bottom: safeArea ? superView.safeAreaLayoutGuide.bottomAnchor : superView.bottomAnchor,
                leading: safeArea ? superView.safeAreaLayoutGuide.leadingAnchor : superView.leadingAnchor,
                trailing: safeArea ? superView.safeAreaLayoutGuide.trailingAnchor : superView.trailingAnchor,
                padding: padding
            )
    }
    
    func edgesToSuperView(exclude anchorType: AnchorType, width: CGFloat? = nil, height: CGFloat? = nil, padding: UIPadding? = nil, safeArea: Bool? = nil) {
        guard let superview = self.superview else { return }
        let safeArea = safeArea ?? false
        let padding = UIPadding(top: padding?.top ?? 0, left: padding?.left ?? 0, bottom: padding?.bottom ?? 0, right: padding?.right ?? 0)
            switch anchorType {
            case .top:
                anchor(
                    bottom:
                    safeArea ? superview.safeAreaLayoutGuide.bottomAnchor : superview.bottomAnchor,
                    leading: safeArea ? superview.safeAreaLayoutGuide.leadingAnchor :  superview.leadingAnchor,
                    trailing: safeArea ? superview.safeAreaLayoutGuide.trailingAnchor : superview.trailingAnchor,
                    padding: padding,
                    width: width,
                    height: height
                )
            case .bottom:
                anchor(
                    top: safeArea ? superview.safeAreaLayoutGuide.topAnchor : superview.topAnchor,
                    leading: safeArea ? superview.safeAreaLayoutGuide.leadingAnchor : superview.leadingAnchor,
                    trailing: safeArea ? superview.safeAreaLayoutGuide.trailingAnchor : superview.trailingAnchor,
                    padding: padding,
                    width: width,
                    height: height
                )
            case .leading:
                anchor(
                    top: safeArea ? superview.safeAreaLayoutGuide.topAnchor : superview.topAnchor,
                    bottom: safeArea ? superview.safeAreaLayoutGuide.bottomAnchor : superview.bottomAnchor,
                    trailing: safeArea ? superview.safeAreaLayoutGuide.trailingAnchor : superview.trailingAnchor,
                    padding: padding,
                    width: width,
                    height: height
                )
            case .trailing:
                anchor(
                    top: safeArea ? superview.safeAreaLayoutGuide.topAnchor : superview.topAnchor,
                    bottom: safeArea ? superview.safeAreaLayoutGuide.bottomAnchor : superview.bottomAnchor,
                    leading: safeArea ? superview.safeAreaLayoutGuide.leadingAnchor : superview.leadingAnchor,
                    padding: padding,
                    width: width,
                    height: height
                )
            }
    }
    
    func anchor(top: YAnchor? = nil, bottom: YAnchor? = nil, leading: XAnchor? = nil, trailing: XAnchor? = nil, padding: UIPadding? = nil, width: CGFloat? = nil, height: CGFloat? = nil) {
        
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
        
        if let trailling = trailing {
            view.trailingAnchor.constraint(equalTo: trailling, constant: -(padding?.right ?? 0)).isActive = true
        }
        
        if let width = width {
            setWidth(width)
        }
        
        if let height = height {
            setHeight(height)
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
    
    func centerInSuperView(width: CGFloat? = nil, height: CGFloat? = nil, safeArea: Bool? = nil ) {
        let view = self
        if let width = width { setWidth(width) }
        if let height = height { setHeight(height) }
        view.centerHorizontally(constant: 0, safeArea: safeArea )
        view.centerVertically(constant: 0, safeArea: safeArea)
    }
    
    func centerInSuperView(safeArea: Bool? = nil) {
        centerInSuperView(width: nil, height: nil, safeArea: safeArea)
    }
    
    func centerHorizontally(constant: CGFloat = 0, safeArea: Bool? = nil) {
        guard let superView = self.superview else { return }
        turnAutoresizingMaskIntoConstraintsOff()
        let safeArea = safeArea ?? false
        self.centerXAnchor.constraint(equalTo: safeArea ? superView.safeAreaLayoutGuide.centerXAnchor : superView.centerXAnchor , constant: constant).isActive = true
    }
    
    func centerVertically(constant: CGFloat = 0, safeArea: Bool? = nil) {
        guard let superView = self.superview else { return }
        turnAutoresizingMaskIntoConstraintsOff()
        let safeArea = safeArea ?? false
        self.centerYAnchor.constraint(equalTo: safeArea ? superView.safeAreaLayoutGuide.centerYAnchor : superView.centerYAnchor, constant: constant).isActive = true
    }
    
    func set(width: CGFloat, height: CGFloat) {
        setWidth(width)
        setHeight(height)
    }
    
    func turnAutoresizingMaskIntoConstraintsOff() {
        if translatesAutoresizingMaskIntoConstraints { translatesAutoresizingMaskIntoConstraints = false }
    }
    
}
