//
//  PostViewModel.swift
//  ZemogaTestApp
//
//  Created by Andres on 9/28/18.
//  Copyright © 2018 Andres. All rights reserved.
//

import UIKit

class PostViewModel {
    private let postManager = PostManager()
    private(set) var posts: [Post] = []
    private(set) var favorites: [Post] = []
    var onDidLoadPosts: (() -> Void)?
    var onDidFailLoad : (() -> Void)?
    
    func loadPosts(forceUpdate:Bool = false) {
        postManager.getPosts(forceUpdate: forceUpdate) {[weak self] (posts) in
            guard let strongSelf = self else {
                return
            }
            strongSelf.posts = posts
            if posts.count == 0 {
                strongSelf.onDidFailLoad?()
            } else {
                strongSelf.onDidLoadPosts?()
            }
            
        }
    }
    
    func loadFavorites() {
        favorites = posts.filter({ (post) -> Bool in
            post.isFavorite
        })
        onDidLoadPosts?()
    }
    
    func markAsRead(post: Post) {
        postManager.markAsRead(this: post)
    }
    
    func delete(post: Post) {
        if let index = posts.index(of: post) {
            postManager.delete(post: post)
            posts.remove(at: index)
            if let indexFav = favorites.index(of: post) {
                favorites.remove(at: indexFav)
            }
        }
    }
    
    func deleteAll() {
        postManager.deleteAll()
        posts.removeAll()
    }
}
