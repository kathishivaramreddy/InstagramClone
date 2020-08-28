//
//  LoginViewController.swift
//  Instagram
//
//  Created by Shiva Ram Reddy on 29/08/20.
//  Copyright © 2020 Shiva Ram Reddy. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    private lazy var userNameField: UITextField = {
        
        return UITextField()
    }()
    
    private lazy var passwordField: UITextField = {
        
        let field = UITextField()
        field.isSecureTextEntry = true
        return field
    }()
    
    private lazy var loginButton: UIButton = {
        
        return UIButton()
    }()
    
    private lazy var termsButton: UIButton = {
        
        return UIButton()
    }()
    
    private lazy var privacyButton: UIButton = {
        
        return UIButton()
    }()
    
    private lazy var createAccountButton: UIButton = {
        
        return UIButton()
    }()
    
    private lazy var headerView: UIView = {
        
        return UIView()
    }()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.addSubviews()
    }
    
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
    }
    
    
    private func addSubviews() {
        
        self.view.addSubview(self.userNameField)
        self.view.addSubview(self.passwordField)
        self.view.addSubview(self.loginButton)
        self.view.addSubview(self.termsButton)
        self.view.addSubview(self.privacyButton)
        self.view.addSubview(self.createAccountButton)
        self.view.addSubview(headerView)
    }
    
    @objc private func didTapLoginButton() {}
    @objc private func didTapPrivacyButton() {}
    @objc private func didTapTermsButton() {}
    @objc private func didTapCreateAccountButton() {}
}
