//
//  UserManager.swift
//  ZemogaTestApp
//
//  Created by Andres on 9/28/18.
//  Copyright © 2018 Andres. All rights reserved.
//

import UIKit
import RealmSwift

typealias UserHandler = (User) -> Void

class UserManager {
    private let contentService: ContentService
    
    init() {
        contentService = DependenciesManager.shared.contentService
    }
    
    func getUserInfo(by userId: Int, handler: @escaping UserHandler) {
        
        let realm = try! Realm()
        let query = realm.object(ofType: User.self, forPrimaryKey: userId)
        
        if let user = query {
            handler(user)
        }
        
        contentService.getUserInfo(By: userId) { (result) in
            switch result {
            case .success(let userInfo):
                
                let user = User(userDTO: userInfo)
                try! realm.write {
                    if let user = query {
                        realm.delete(user)
                    }
                    realm.add(user)
                }
                handler(user)
                break
            case .failure(_):
                break
            }
        }
    }
}
