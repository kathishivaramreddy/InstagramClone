//
//  RegistrationViewController.swift
//  Instagram
//
//  Created by Shiva Ram Reddy on 31/08/20.
//  Copyright © 2020 Shiva Ram Reddy. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    struct Constant {
        
        static var cornerRadius: CGFloat = 8.0
    }
    
    private lazy var userNameField: UITextField = {
        
        let field = UITextField()
        field.placeholder = "Username ..."
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
    
    private lazy var emailField: UITextField = {
        
        let field = UITextField()
        field.placeholder = "Email ..."
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
    
    private lazy var registerButton: UIButton = {
        
        let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Constant.cornerRadius
        button.backgroundColor = .systemGreen
        return button
    }()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        
        self.addSubViews()
        self.registerButton.addTarget(self
            , action: #selector(didTapRegisterButton)
            , for: .touchUpInside)
        self.userNameField.delegate = self
        self.passwordField.delegate = self
    }
    
    func addSubViews() {
        
        self.view.addSubview(self.userNameField)
        self.view.addSubview(self.emailField)
        self.view.addSubview(self.passwordField)
        self.view.addSubview(self.registerButton)
    }
    
    
    @objc func didTapRegisterButton() {
        
        self.userNameField.resignFirstResponder()
        self.emailField.resignFirstResponder()
        self.passwordField.resignFirstResponder()
        
        guard let userName = userNameField.text, !userName.isEmpty
            , let email = emailField.text, !email.isEmpty
            , let password = passwordField.text, password.count >= 8 else { return }
        
        AuthManager.shared.register(userName: userName, email: email, password: password)
        
    }
    
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        
        self.userNameField.frame = CGRect(x: 20
            , y: self.view.safeAreaInsets.top + 100
            , width: self.view.frame.size.width - 40
            , height: 52)
        
        self.emailField.frame = CGRect(x: 20
        , y: self.userNameField.frame.origin.y + self.userNameField.frame.size.height + 10
        , width: self.view.frame.size.width - 40
        , height: 52)
        
        self.passwordField.frame = CGRect(x: 20
            , y: self.emailField.frame.origin.y + self.emailField.frame.size.height + 10
            , width: self.view.frame.size.width - 40
            , height: 52)
        
        self.registerButton.frame = CGRect(x: 20
            , y: self.passwordField.frame.origin.y + self.passwordField.frame.size.height + 10
            , width: self.view.frame.size.width - 40
            , height: 52)
    }
}

extension RegistrationViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == userNameField {
            
            self.emailField.becomeFirstResponder()
        } else if textField == emailField {
            
            self.passwordField.becomeFirstResponder()
        } else {
            
            self.didTapRegisterButton()
        }
        return true
    }
}
