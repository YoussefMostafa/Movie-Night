//
//  LoginProfileSetupController.swift
//  Movie Night
//
//  Created by Youssef Mostafa on 11/14/18.
//  Copyright © 2018 UsefDev. All rights reserved.
//

import UIKit
import SDWebImage

class LoginProfileSetupController: MNViewController {
    
    // MARK: - Attributes
    
    private var dataSource: LoginProfileViewModel? {
        willSet {
            welcomeLabel.text = newValue?.welcomeText
            cautionLabel.text = newValue?.cautionText
            userNameTextField.text = newValue?.username
            profileLoadingView.startAnimating()
            profileImageView.sd_setImage(with: newValue?.profilePic, placeholderImage: #imageLiteral(resourceName: "Oval"), options: .progressiveDownload) { (image, error, caheType, url) in
                self.profileLoadingView.stopAnimating()
            }
        }
    }
    
    var userInfo: UserInfo? {
        willSet {
            guard let userInfo = newValue else { return }
            dataSource = LoginProfileViewModel(userInfo)
        }
    }
    
    // MARK: - Views
    
    private(set) var welcomeLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        label.textColor = .white
        return label
    }()
    
    private(set) var cautionLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor.rgb(135, 145, 149)
        label.numberOfLines = 0
        return label
    }()
    
    private(set) var profileLoadingView: UIActivityIndicatorView = {
        let loadingView = UIActivityIndicatorView()
        loadingView.color = .black
        return loadingView
    }()
    
    private(set) lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 47
        imageView.image = #imageLiteral(resourceName: "Oval")
        imageView.layer.masksToBounds = true
        imageView.addSubview(profileLoadingView)
        profileLoadingView.centerInSuperView()
        profileLoadingView.set(width: 18, height: 18)
        return imageView
    }()
    
    private(set) var choosePictureButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Choose another picture", for: .normal)
        button.backgroundColor = .clear
        button.tintColor = UIColor.rgb(135, 145, 149)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        return button
    }()
    
    private(set) var userNameTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.layer.shadowColor = UIColor.rgb(55, 71, 79, 0.45).cgColor
        textField.layer.shadowOpacity = 1
        textField.layer.shadowOffset = CGSize(width: 0, height: 1)
        textField.layer.shadowRadius = 0
        textField.backgroundColor = UIColor.rgb(20, 29, 38)
        textField.textColor = UIColor.rgb(55, 71, 79)
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return textField
    }()
    
    private(set) var continueButton: MNButton = {
        let button = MNButton(type: .system)
        button.backgroundColor = UIColor.rgb(67, 71, 86)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        button.tintColor = .white
        button.layer.cornerRadius = 2
        return button
    }()
    
    // MARK: - Class Methods
    
    override func setupUI() {
        view.backgroundColor = UIColor.rgb(20, 29, 38)
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        navigationItem.hidesBackButton = true
        navigationController?.isNavigationBarHidden = false
        continueButton.setTitle("Continue", for: .normal)
        navigationItem.title = "Profile"
    }
    
    override func setupSubViews() {
        view.addSubview(navigationController!.navigationBar)
        view.addSubview(welcomeLabel)
        view.addSubview(cautionLabel)
        view.addSubview(profileImageView)
        view.addSubview(choosePictureButton)
        view.addSubview(userNameTextField)
        view.addSubview(continueButton)
    }
    
    override func setupConstraints() {
        
        welcomeLabel.anchor(
            top: navigationController!.navigationBar.bottomAnchor,
            leading: view.leadingAnchor,
            trailing: view.trailingAnchor,
            padding: UIPadding(top: 29, left: 24, right: 24),
            height: 32
        )
        
        cautionLabel.anchor(
            top: welcomeLabel.bottomAnchor,
            leading: welcomeLabel.leadingAnchor,
            trailing: welcomeLabel.trailingAnchor,
            padding: UIPadding(top: 2),
            height: 40
        )
        
        profileImageView.set(width: 95, height: 95)
        profileImageView.centerHorizontally()
        profileImageView.anchorTop(cautionLabel.bottomAnchor, padding: 45)
        
        choosePictureButton.anchorTop(profileImageView.bottomAnchor, padding: 20)
        choosePictureButton.centerHorizontally()
        choosePictureButton.setHeight(16)
        
        userNameTextField.anchor(
            top: choosePictureButton.bottomAnchor,
            leading: welcomeLabel.leadingAnchor,
            trailing: welcomeLabel.trailingAnchor,
            padding: UIPadding(top: 34),
            height: 45
        )
        
        continueButton.anchor(
            top: userNameTextField.bottomAnchor,
            leading: welcomeLabel.leadingAnchor,
            trailing: welcomeLabel.trailingAnchor,
            padding: UIPadding(top: 32),
            height: 46
        )
        
    }
}
