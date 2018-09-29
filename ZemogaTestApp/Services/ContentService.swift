//
//  ContentService.swift
//  ZemogaTestApp
//
//  Created by Andres on 9/28/18.
//  Copyright © 2018 Andres. All rights reserved.
//

import Foundation

typealias ResponseJSON = [String : Any]
typealias PostResponseHandler = (Response<[PostDTO]>) -> Void
typealias UserResponseHandler = (Response<UserDTO>) -> Void
typealias CommentsResponseHandler = (Response<[CommentDTO]>) -> Void

protocol ContentService {
    func getPosts(handler: @escaping PostResponseHandler)
    func getUserInfo(By userId: Int, handler: @escaping UserResponseHandler )
    func getComments(by postId: Int, handler: @escaping CommentsResponseHandler)
}

