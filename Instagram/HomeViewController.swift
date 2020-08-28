//
//  ViewController.swift
//  Instagram
//
//  Created by Shiva Ram Reddy on 28/08/20.
//  Copyright © 2020 Shiva Ram Reddy. All rights reserved.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        
        
        super.viewDidLoad()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        if Auth.auth().currentUser == nil {
            
            let vc = LoginViewController()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: false, completion: nil)
        }
    }
    
}

