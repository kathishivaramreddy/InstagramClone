//
//  SettingsViewController.swift
//  Instagram
//
//  Created by Shiva Ram Reddy on 04/09/20.
//  Copyright © 2020 Shiva Ram Reddy. All rights reserved.
//

import UIKit
import FirebaseAuth

struct SettingCellModel {
    
    let title: String
    let handler: () -> Void
}

class SettingsViewController: UIViewController {
    
    private var data = [[SettingCellModel]]()
    
    private lazy var tableView: UITableView = {
        
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view.addSubview(self.tableView)
        tableView.delegate = self
        tableView.dataSource = self
        self.configureModels()
    }
    
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        self.tableView.frame = self.view.bounds
    }
    
    private func configureModels() {
        
        let section = [
        
            SettingCellModel(title: "Log Out") { [weak self] in
                
                self?.didTapLogOut()
            }
        ]
        
        data.append(section)
    }
    
    private func didTapLogOut() {
        
        let actionSheet = UIAlertController(title: "Log Out"
            , message: "Are you sure you want to log out"
            , preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Log Out", style: .destructive, handler: { _ in
            
            AuthManager.shared.logOut { (loggedOut) in
                
                if loggedOut {
                    
                    DispatchQueue.main.async {
                        
                        let loginVC = LoginViewController()
                        loginVC.modalPresentationStyle = .fullScreen
                        self.present(loginVC, animated: true) {
                            
                            self.navigationController?.popViewController(animated: false)
                            self.tabBarController?.selectedIndex = 0
                        }
                    }
                } else {
                    
                    
                }
            }
        }))
        
        self.present(actionSheet, animated: false)
    }
}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return data[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.section][indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        data[indexPath.section][indexPath.row].handler()
    }
}
