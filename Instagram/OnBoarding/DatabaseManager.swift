//
//  DatabaseManager.swift
//  Instagram
//
//  Created by Shiva Ram Reddy on 01/09/20.
//  Copyright © 2020 Shiva Ram Reddy. All rights reserved.
//

import FirebaseDatabase

public class DatabaseManager {
    
    static let shared = DatabaseManager()
    
    private let database = Database.database().reference()
    
    public func canCreateAccount(with email: String, userName: String, password: String, completion: @escaping (Bool) -> Void) {
        
        completion(true)
    }
    
    public func insertNewUser(with email: String, userName: String, completion: @escaping (Bool) -> Void) {
        
        database.child(email.safeKeyForDataBase()).setValue(["userName": userName]) { (error, _) in
            
            guard error == nil else {
                
                completion(false)
                return
            }
            
            completion(true)
        }
    }
}
