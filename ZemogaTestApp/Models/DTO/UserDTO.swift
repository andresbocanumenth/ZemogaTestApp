//
//  UserDTO.swift
//  ZemogaTestApp
//
//  Created by Andres on 9/28/18.
//  Copyright © 2018 Andres. All rights reserved.
//

import Foundation
import ObjectMapper

struct UserDTO : Mappable {
    
    var id: Int = 0
    var name: String = ""
    var email: String = ""
    var phone: String = ""
    var website: String = ""
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        email <- map["email"]
        phone <- map["phone"]
        website <- map["website"]
    }
}
