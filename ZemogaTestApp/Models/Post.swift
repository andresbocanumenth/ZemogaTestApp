//
//  Post.swift
//  ZemogaTestApp
//
//  Created by Andres on 9/28/18.
//  Copyright © 2018 Andres. All rights reserved.
//

import UIKit
import RealmSwift

class Post: Object {
    @objc dynamic var userId: Int = 0
    @objc dynamic var id: Int = 0
    @objc dynamic var title: String = ""
    @objc dynamic var body: String = ""
    @objc dynamic var isFavorite: Bool = false
    @objc dynamic var viewed: Bool = true
    
    convenience init(postDTO: PostDTO) {
        self.init()
        userId = postDTO.userId
        id = postDTO.id
        title = postDTO.title
        body = postDTO.body
    }
    
}
