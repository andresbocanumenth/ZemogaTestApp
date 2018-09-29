//
//  CommentManager.swift
//  ZemogaTestApp
//
//  Created by Andres on 9/28/18.
//  Copyright © 2018 Andres. All rights reserved.
//

import UIKit
import RealmSwift

typealias CommentHandler = ([Comment]) -> Void

class CommentManager {
    private let contentService: ContentService
    
    init() {
        contentService = DependenciesManager.shared.contentService
    }
    
    func loadComments(by postId: Int, handler: @escaping CommentHandler) {
        contentService.getComments(by: postId) { (result) in
            switch result {
            case .success(let comments):
                let commentsObjs = comments.map{ Comment(commentDTO: $0) }
                handler(commentsObjs)
                break
            case .failure(_):
                break
            }
        }
    }
}
