//
//  ProfileViewController.swift
//  Instagram
//
//  Created by Shiva Ram Reddy on 04/09/20.
//  Copyright © 2020 Shiva Ram Reddy. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.configureNavigationBar()
    }
    
    private func configureNavigationBar() {
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear")
            , style: .plain
            , target: self, action: #selector(didTapSettings))
    }
    
    @objc private func didTapSettings() {
        
        let settingsVC = SettingsViewController()
        settingsVC.title = "Settings"
        
        self.navigationController?.pushViewController(settingsVC, animated: false)
    }
}
