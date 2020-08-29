//
//  LoginViewController.swift
//  Instagram
//
//  Created by Shiva Ram Reddy on 29/08/20.
//  Copyright © 2020 Shiva Ram Reddy. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    struct Constant {
        
        static var cornerRadius: CGFloat = 8.0
    }
    
    private lazy var userNameField: UITextField = {
        
        let field = UITextField()
        field.placeholder = "Username or Email ..."
        field.returnKeyType = .next
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocorrectionType = .no
        field.autocapitalizationType = .none
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constant.cornerRadius
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        return field
    }()
    
    private lazy var passwordField: UITextField = {
        
        let field = UITextField()
        field.isSecureTextEntry = true
        field.placeholder = "Password..."
        field.returnKeyType = .continue
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocorrectionType = .no
        field.autocapitalizationType = .none
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constant.cornerRadius
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        return field
    }()
    
    private lazy var loginButton: UIButton = {
        
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Constant.cornerRadius
        button.backgroundColor = .systemBlue
        return button
    }()
    
    private lazy var termsButton: UIButton = {
        
        let button = UIButton()
        button.setTitle("Terms and Condition", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        return button
    }()
    
    private lazy var privacyButton: UIButton = {
        
        let button = UIButton()
        button.setTitle("Privacy", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        return button
    }()
    
    private lazy var createAccountButton: UIButton = {
        
        let button = UIButton()
        button.setTitleColor(.label, for: .normal)
        button.setTitle("New User? Create an Account", for: .normal)
        return button
    }()
    
    private lazy var headerView: UIView = {
        
        let header = UIView(frame: CGRect(x: 0
            , y: 0
            , width: self.view.frame.size.width
            , height: self.view.frame.size.height/3.0))
        header.clipsToBounds = true
        header.backgroundColor = .red
        
        return header
    }()
    
    private lazy var backgroudView: UIImageView = {
        
        let backgroundView = UIImageView(image: UIImage(named: "gradient"))
        backgroundView.frame = self.headerView.bounds
        return backgroundView
    }()
    
    private lazy var logoView: UIImageView = {
        
        let imageView = UIImageView(image: UIImage(named: "text"))
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: self.headerView.frame.size.width/4.0
            , y: self.view.safeAreaInsets.top
            , width: self.headerView.frame.size.width/2.0
            , height: self.headerView.frame.size.height - self.view.safeAreaInsets.top)
        return imageView
    }()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.addSubviews()
        
        self.view.backgroundColor = .systemBackground
        
        self.userNameField.delegate = self
        self.passwordField.delegate = self
        
        self.addButtonTargets()
    }
    
    private func addButtonTargets() {
        
        self.loginButton.addTarget(self
            , action: #selector(didTapLoginButton)
            , for: .touchUpInside)
        
        self.createAccountButton.addTarget(self
            , action: #selector(didTapCreateAccountButton)
            , for: .touchUpInside)
        
        self.termsButton.addTarget(self
            , action: #selector(didTapTermsButton)
            , for: .touchUpInside)
        
        self.privacyButton.addTarget(self
            , action: #selector(didTapPrivacyButton)
            , for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        
        self.userNameField.frame = CGRect(x: 25
            , y: self.headerView.frame.origin.y + self.headerView.frame.size.height + 40
            , width: self.view.frame.size.width - 50
            , height: 52)
        
        self.passwordField.frame = CGRect(x: 25
            , y: self.userNameField.frame.origin.y + self.userNameField.frame.size.height + 10
            , width: self.view.frame.size.width - 50
            , height: 52)
        
        self.loginButton.frame = CGRect(x: 25
            , y: self.passwordField.frame.origin.y + self.passwordField.frame.size.height + 10
            , width: self.view.frame.size.width - 50
            , height: 52)
        
        self.createAccountButton.frame = CGRect(x: 25
            , y: self.loginButton.frame.origin.y + self.loginButton.frame.size.height + 10
            , width: self.view.frame.size.width - 50
            , height: 52)
        
        self.termsButton.frame = CGRect(x: 10
            , y: self.view.frame.size.height - self.view.safeAreaInsets.bottom - 100
            , width: self.view.frame.size.width - 20
            , height: 50)
        
        self.privacyButton.frame = CGRect(x: 10
        , y: self.view.frame.size.height - self.view.safeAreaInsets.bottom - 50
        , width: self.view.frame.size.width - 20
        , height: 50)
        
    }
    
    
    private func addSubviews() {
        
        self.view.addSubview(self.userNameField)
        self.view.addSubview(self.passwordField)
        self.view.addSubview(self.loginButton)
        self.view.addSubview(self.termsButton)
        self.view.addSubview(self.privacyButton)
        self.view.addSubview(self.createAccountButton)
        self.view.addSubview(headerView)
        self.headerView.addSubview(self.backgroudView)
        self.headerView.addSubview(self.logoView)
    }
    
    @objc private func didTapLoginButton() {
        
        passwordField.resignFirstResponder()
        
        guard let userName = self.userNameField.text
            , let password = self.passwordField.text
            , !userName.isEmpty
            , !password.isEmpty
            , password.count >= 8 else { return }
        
        //TODO:- Implement Login Functionality
    }
    @objc private func didTapPrivacyButton() {}
    @objc private func didTapTermsButton() {}
    @objc private func didTapCreateAccountButton() {}
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == userNameField {
            
            passwordField.becomeFirstResponder()
        } else if textField == passwordField {
            
            self.didTapLoginButton()
        }
        
        return true
    }
}
