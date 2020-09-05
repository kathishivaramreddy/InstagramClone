//
//  NotificationsViewController.swift
//  Instagram
//
//  Created by Shiva Ram Reddy on 05/09/20.
//  Copyright © 2020 Shiva Ram Reddy. All rights reserved.
//

import UIKit

class NotificationsViewController: UIViewController {

    private lazy var tableView: UITableView = {
    
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(NotificationTableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.navigationItem.title = "Notifications"
        
        self.view.backgroundColor = .systemBackground
    }
    
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        self.tableView.frame = self.view.bounds
    }
}

extension NotificationsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        return cell
    }
}
