//
//  PostTableViewCell.swift
//  ZemogaTestApp
//
//  Created by Andres on 9/28/18.
//  Copyright © 2018 Andres. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var starImg: UIImageView!
    @IBOutlet weak var viewedImage: UIImageView!
    
    static let identifier = "PostTableViewCell"
    
    func configure(With post: Post) {
        titleLbl.text = post.title
        starImg.isHidden = !post.isFavorite
        viewedImage.isHidden = post.viewed
    }
}
