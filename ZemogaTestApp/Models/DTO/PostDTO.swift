//
//  PostDTO.swift
//  ZemogaTestApp
//
//  Created by Andres on 9/28/18.
//  Copyright © 2018 Andres. All rights reserved.
//

import Foundation
import ObjectMapper

struct PostDTO : Mappable {
    
    var userId: Int = 0
    var id: Int = 0
    var title: String = ""
    var body: String = ""
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        userId <- map["userId"]
        id <- map["id"]
        title <- map["title"]
        body <- map["body"]
    }
}
