//
//  AuthManagger.swift
//  Instagram
//
//  Created by Shiva Ram Reddy on 31/08/20.
//  Copyright © 2020 Shiva Ram Reddy. All rights reserved.
//

import Foundation
import FirebaseAuth

public class AuthManager {
    
    static let shared = AuthManager()
    
    public func register(userName: String, email: String, password: String) {
        
    }
    
    public func login(userName: String?, email: String?, password: String, completion: @escaping (Bool) -> Void) {
        
        if let email = email {
            
            Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                
                guard error == nil else {
                    
                    completion(false)
                    return
                }
                
                completion(true)
            }
        } else if let userName = userName {
            
            
        }
    }
}
