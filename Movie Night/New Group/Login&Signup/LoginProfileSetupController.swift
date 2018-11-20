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
    
    var userInfo: UserModel? {
        willSet {
            guard let userInfo = newValue else { return }
            dataSource = LoginProfileViewModel(userInfo)
        }
    }
    
    // MARK: - Views
    
    private var welcomeLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        label.textColor = .white
        return label
    }()
    
    private var cautionLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor.rgb(135, 145, 149)
        label.numberOfLines = 0
        return label
    }()
    
    private var profileLoadingView: UIActivityIndicatorView = {
        let loadingView = UIActivityIndicatorView()
        loadingView.color = .black
        return loadingView
    }()
    
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 47
        imageView.image = #imageLiteral(resourceName: "Oval")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.addSubview(profileLoadingView)
        profileLoadingView.centerInSuperView()
        profileLoadingView.set(width: 18, height: 18)
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    private lazy var choosePictureButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Choose another picture", for: .normal)
        button.backgroundColor = .clear
        button.tintColor = UIColor.rgb(135, 145, 149)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        button.addTarget(self, action: #selector(choosePictureButtonHandler), for: .touchUpInside)
        return button
    }()
    
    private lazy var userNameTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.layer.shadowColor = UIColor.rgb(55, 71, 79, 0.45).cgColor
        textField.layer.shadowOpacity = 1
        textField.layer.shadowOffset = CGSize(width: 0, height: 1)
        textField.layer.shadowRadius = 0
        textField.backgroundColor = UIColor.rgb(20, 29, 38)
        textField.textColor = UIColor.rgb(55, 71, 79)
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.returnKeyType = .done
        textField.delegate = self
        textField.keyboardAppearance = .dark
        return textField
    }()
    
    private var continueButton: MNButton = {
        let button = MNButton(type: .system)
        button.backgroundColor = UIColor.rgb(67, 71, 86)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        button.tintColor = .white
        button.layer.cornerRadius = 2
        return button
    }()
    
    // MARK: - Class Methods
    
    override func setupUI() {
        setupNavigationControllerUI()
        setupGestures()
        setupMainUI()
    }
    
    private func setupNavigationControllerUI() {
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        navigationItem.hidesBackButton = true
        navigationController?.isNavigationBarHidden = false
        navigationItem.title = "Profile"
    }
    
    private func setupGestures() {
        let tapGestureToDismissKeyboard = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        let tapGestureToOpenImagePicker = UITapGestureRecognizer(target: self, action: #selector(choosePictureButtonHandler))
        view.addGestureRecognizer(tapGestureToDismissKeyboard)
        profileImageView.addGestureRecognizer(tapGestureToOpenImagePicker)
    }
    
    private func setupMainUI() {
        view.backgroundColor = UIColor.rgb(20, 29, 38)
        continueButton.setTitle("Continue", for: .normal)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc private func choosePictureButtonHandler() {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum) {
            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self
            imagePickerController.allowsEditing = false
            present(imagePickerController, animated: true)
        }
    }
    
    override func keyboardWillShow(_ notification: Notification) {
        let frame = userNameTextField.frame
        let keyboardFrame = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        if frame.maxY >= keyboardFrame.minY {
            let yOffset = (frame.maxY+8) - keyboardFrame.minY
            UIView.animate(withDuration: 0.3) {
                self.view.frame = CGRect(x: 0, y: -yOffset, width: self.view.frame.width, height: self.view.frame.height)
                self.welcomeLabel.isHidden = true
                self.cautionLabel.isHidden = true
            }
        }
    }
    
    override func keyboardWillHide(_ notification: Notification) {
        if self.view.frame.minY < 0 {
            UIView.animate(withDuration: 0.3) {
                self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
                self.welcomeLabel.isHidden = false
                self.cautionLabel.isHidden = false
            }
        }
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

// MARK: - ImagePicker Extension

extension LoginProfileSetupController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            profileImageView.image = image
            picker.dismiss(animated: true)
        }
    }
}

// MARK: - TextFeild Extension

extension LoginProfileSetupController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}
