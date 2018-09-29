//
//  Comment.swift
//  ZemogaTestApp
//
//  Created by Andres on 9/28/18.
//  Copyright © 2018 Andres. All rights reserved.
//

import UIKit
import RealmSwift

class Comment: Object {
    
    @objc dynamic var postId: Int = 0
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var email: String = ""
    @objc dynamic var body: String = ""

    convenience init(commentDTO: CommentDTO) {
        self.init()
        postId = commentDTO.postId
        id = commentDTO.id
        name = commentDTO.name
        email = commentDTO.email
        body = commentDTO.body
    }
}
