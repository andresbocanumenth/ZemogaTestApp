//
//  PostDetailViewModel.swift
//  ZemogaTestApp
//
//  Created by Andres on 9/28/18.
//  Copyright © 2018 Andres. All rights reserved.
//

import Foundation

class PostDetailViewModel {
    private let postManager = PostManager()
    private let userManager = UserManager()
    private let commentManager = CommentManager()
    private(set) var userInfo: User?
    private(set) var comments: [Comment] = []
    
    var onDidLoadComments: (() -> Void)?
    var onDidLoadUserInfo: (() -> Void)?
    var onDidFailLoad : (() -> Void)?
    
    func loadUserInfo(by userId: Int) {
        userManager.getUserInfo(by: userId) {[weak self] (user) in
            guard let strongSelf = self else {
                return
            }
            strongSelf.userInfo = user
            strongSelf.onDidLoadUserInfo?()
        }
    }
    
    func loadComments(by postId: Int) {
        commentManager.loadComments(by: postId) {[weak self] (comments) in
            guard let strongSelf = self else {
                return
            }
            strongSelf.comments = comments
            strongSelf.onDidLoadComments?()
        }
    }
    
    func setFavorite(this post: Post, isFavorite: Bool) {
        postManager.setFavorite(this: post, isFavorite: isFavorite)
    }
    
    
}
