//
//  String+Extension.swift
//  Instagram
//
//  Created by Shiva Ram Reddy on 01/09/20.
//  Copyright © 2020 Shiva Ram Reddy. All rights reserved.
//

extension String {
    
    func safeKeyForDataBase() -> String {
        
        return self.replacingOccurrences(of: ".", with: "-")
    }
}
