//
//  ProfileViewController.swift
//  Instagram
//
//  Created by Shiva Ram Reddy on 04/09/20.
//  Copyright © 2020 Shiva Ram Reddy. All rights reserved.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    private var collectionView: UICollectionView!

    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.navigationItem.title = "Profile"
        self.configureNavigationBar()
        
        self.setupCollectionViewLayout()
        
        self.view.addSubview(self.collectionView)
        self.collectionView.backgroundColor = .systemBackground
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        self.collectionView.frame = self.view.bounds
    }
    
    private func setupCollectionViewLayout() {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: self.view.frame.width/3, height: self.view.frame.width/3)
        
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        self.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
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

extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}
