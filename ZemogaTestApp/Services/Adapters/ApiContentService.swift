//
//  ApiContentService.swift
//  ZemogaTestApp
//
//  Created by Andres on 9/28/18.
//  Copyright © 2018 Andres. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

struct ApiContentService : ContentService {
    let baseUrl = BuildManager.shared.currentBuildEnviornment.contentBaseURl
    
    func getPosts(handler: @escaping PostResponseHandler) {
        let endpoint = baseUrl + "posts"
        Alamofire.request(endpoint).responseJSON { response in
            guard let json = response.result.value as? [ResponseJSON] else {
                handler(.failure(.serviceFailure))
                return
            }
            let posts = Mapper<PostDTO>().mapArray(JSONArray: json)
            handler(.success(posts))
        }
    }
    
    func getUserInfo(By userId: Int, handler: @escaping UserResponseHandler) {
        let endpoint = baseUrl + "users?id=\(userId)"
        Alamofire.request(endpoint).responseJSON { response in
            guard let jsonArray = response.result.value as? [ResponseJSON],
                    let json = jsonArray.first,
                        let userInfo = UserDTO(JSON: json) else {
                handler(.failure(.serviceFailure))
                return
            }
            handler(.success(userInfo))
        }
    }
    
    func getComments(by postId: Int, handler: @escaping CommentsResponseHandler) {
        let endpoint = baseUrl + "comments?postId=\(postId)"
        Alamofire.request(endpoint).responseJSON { response in
            guard let json = response.result.value as? [ResponseJSON] else {
                handler(.failure(.serviceFailure))
                return
            }
            let comments = Mapper<CommentDTO>().mapArray(JSONArray: json)
            handler(.success(comments))
        }
    }
    
}
