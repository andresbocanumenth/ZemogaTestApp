//
//  CommentDTO.swift
//  ZemogaTestApp
//
//  Created by Andres on 9/28/18.
//  Copyright © 2018 Andres. All rights reserved.
//

import Foundation
import ObjectMapper

struct CommentDTO : Mappable {
    
    var postId: Int = 0
    var id: Int = 0
    var name: String = ""
    var email: String = ""
    var body: String = ""
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        postId <- map["postId"]
        id <- map["id"]
        name <- map["name"]
        email <- map["email"]
        body <- map["body"]
    }
}
