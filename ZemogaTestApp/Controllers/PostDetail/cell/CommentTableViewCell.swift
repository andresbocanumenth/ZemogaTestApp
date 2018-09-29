//
//  CommentTableViewCell.swift
//  ZemogaTestApp
//
//  Created by Andres on 9/28/18.
//  Copyright © 2018 Andres. All rights reserved.
//

import UIKit

class CommentTableViewCell: UITableViewCell {

    static let identifier = "CommentTableViewCell"
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    
    func configure(with comment: Comment) {
        emailLabel.text = comment.email
        commentLabel.text = comment.body
    }
}
