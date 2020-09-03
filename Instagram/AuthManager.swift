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
    
    public func register(userName: String, email: String, password: String, completion: @escaping (Bool) -> Void) {
        
        DatabaseManager.shared.canCreateAccount(with: email
            , userName: userName
        , password: password) { (canCreate) in
            
            guard canCreate else {
                
                completion(false)
                return
            }
            
            Auth.auth().createUser(withEmail: email, password: userName) { (result, error) in
                
                guard error == nil, result != nil else {
                    
                    completion(false)
                    return
                }
                
                //Insert into db
                DatabaseManager.shared.insertNewUser(with: email, userName: userName) { (inserted) in
                    
                    guard inserted else {
                        
                        completion(false)
                        return
                    }
                    
                    completion(true)
                    return
                }
            }
        }
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
    
    public func logOut(completionHandler: @escaping (Bool) -> Void) {
        
        do {
            
            try Auth.auth().signOut()
            completionHandler(true)
        } catch {
            
            completionHandler(false)
        }
    }
}
