//
//  NotificationTableViewCell.swift
//  Instagram
//
//  Created by Shiva Ram Reddy on 05/09/20.
//  Copyright © 2020 Shiva Ram Reddy. All rights reserved.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        
        super.awakeFromNib()
    }
    
    private lazy var iconImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "gradient")
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 8
        return imageView
    }()
    
    private lazy var notificationLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Notification Text"
        return label
    }()
    
    private lazy var postImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "gradient")
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 8
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setupViews()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        
        self.contentView.addSubview(self.iconImageView)
        self.contentView.addSubview(self.notificationLabel)
        self.contentView.addSubview(self.postImageView)
    }
    
    private func setupConstraints() {
        
//        self.iconImageView.frame
    }
}
