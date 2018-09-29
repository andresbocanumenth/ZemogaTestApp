//
//  PostManager.swift
//  ZemogaTestApp
//
//  Created by Andres on 9/28/18.
//  Copyright © 2018 Andres. All rights reserved.
//

import UIKit
import RealmSwift

typealias PostsHandler = ([Post]) -> Void

class PostManager {
    
    private let getLastServiceCalled = "GetLastServiceCalled"
    private let contentService: ContentService
    private let minMinutes = 60
    private var dateOfLastServiceCall : Date {
        set {
            UserDefaults.standard.set(newValue.timeIntervalSince1970, forKey: getLastServiceCalled)
            UserDefaults.standard.synchronize()
        }
        get {
            if  UserDefaults.standard.double(forKey: getLastServiceCalled) != 0 {
                let dateValue = UserDefaults.standard.double(forKey: getLastServiceCalled)
                return Date(timeIntervalSince1970: dateValue)
            } else {
                return Date(timeIntervalSince1970: 0)
            }
        }
    }
    
    init() {
        contentService = DependenciesManager.shared.contentService
    }
    
    func getPosts(forceUpdate: Bool = false, handler: @escaping PostsHandler) {
        let minutesPassed = (Calendar.current.dateComponents([.minute], from: dateOfLastServiceCall, to: Date())).minute ?? 0
        let realm = try! Realm()
        
        if minutesPassed > minMinutes || forceUpdate {
            self.dateOfLastServiceCall = Date()
            
            contentService.getPosts { (result) in
                switch result {
                case .success(let posts):
                    let postObjects = posts.map{ Post(postDTO: $0) }
                    if postObjects.count > 21 {
                        for index in 0..<20 {
                            let post = postObjects[index]
                            post.viewed = false
                        }
                    }
                    try! realm.write {
                        realm.delete(realm.objects(Post.self))
                        realm.add(postObjects)
                    }
                    handler(postObjects)
                    break
                case .failure(_):
                    break
                }
            }
            
        } else {
            let results = realm.objects(Post.self).sorted(byKeyPath: "id", ascending: true)
            handler(Array(results))
        }
    }
    
    func markAsRead(this post: Post) {
        let realm = try! Realm()
        try! realm.write {
            post.viewed = true
        }
    }
    
    func setFavorite(this post: Post, isFavorite: Bool) {
        let realm = try! Realm()
        try! realm.write {
            post.isFavorite = isFavorite
        }
    }
    
    func delete(post: Post) {
        let realm = try! Realm()
        try! realm.write {
            realm.delete(post)
        }
    }
    
    func deleteAll() {
        let realm = try! Realm()
        try! realm.write {
            realm.delete(realm.objects(Post.self))
        }
    }
}
