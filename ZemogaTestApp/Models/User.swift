//
//  User.swift
//  ZemogaTestApp
//
//  Created by Andres on 9/28/18.
//  Copyright © 2018 Andres. All rights reserved.
//

import UIKit
import RealmSwift

class User: Object {
    
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var email: String = ""
    @objc dynamic var phone: String = ""
    @objc dynamic var website: String = ""

    convenience init(userDTO: UserDTO) {
        self.init()
        id = userDTO.id
        name = userDTO.name
        email = userDTO.email
        phone = userDTO.phone
        website = userDTO.website
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }

}
