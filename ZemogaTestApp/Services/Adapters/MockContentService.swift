//
//  MockContentService.swift
//  ZemogaTestApp
//
//  Created by Andres on 9/28/18.
//  Copyright © 2018 Andres. All rights reserved.
//

import Foundation
import ObjectMapper

struct MockContentService: ContentService {
    
    var testSuccessfull: Bool
    
    func getPosts(handler: @escaping PostResponseHandler) {
        if testSuccessfull {
            let jsonArray = mock_getPost()
            let posts = Mapper<PostDTO>().mapArray(JSONArray: jsonArray)
            handler(.success(posts))
        } else {
            handler(.failure(.generic))
        }
    }
    
    func getUserInfo(By userId: Int, handler: @escaping UserResponseHandler) {
        if testSuccessfull {
            let jsonArray = mock_getUserInfo()
            guard let json = jsonArray.first, let response = UserDTO(JSON: json) else {
                handler(.failure(.generic))
                return
            }
            handler(.success(response))
        } else {
            handler(.failure(.generic))
        }
    }
    
    func getComments(by postId: Int, handler: @escaping CommentsResponseHandler) {
        if testSuccessfull {
            let jsonArray = mock_getComments()
            let comments = Mapper<CommentDTO>().mapArray(JSONArray: jsonArray)
            handler(.success(comments))
        } else {
            handler(.failure(.generic))
        }
    }
    
    
    private func mock_getPost() -> [ResponseJSON] {
        return [
            [
                "userId": 1,
                "id": 1,
                "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
                "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
            ],
            [
                "userId": 1,
                "id": 2,
                "title": "qui est esse",
                "body": "est rerum tempore vitae\nsequi sint nihil reprehenderit dolor beatae ea dolores neque\nfugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis\nqui aperiam non debitis possimus qui neque nisi nulla"
            ],
            [
                "userId": 1,
                "id": 3,
                "title": "ea molestias quasi exercitationem repellat qui ipsa sit aut",
                "body": "et iusto sed quo iure\nvoluptatem occaecati omnis eligendi aut ad\nvoluptatem doloribus vel accusantium quis pariatur\nmolestiae porro eius odio et labore et velit aut"
            ],
            [
                "userId": 1,
                "id": 4,
                "title": "eum et est occaecati",
                "body": "ullam et saepe reiciendis voluptatem adipisci\nsit amet autem assumenda provident rerum culpa\nquis hic commodi nesciunt rem tenetur doloremque ipsam iure\nquis sunt voluptatem rerum illo velit"
            ],
            [
                "userId": 1,
                "id": 5,
                "title": "nesciunt quas odio",
                "body": "repudiandae veniam quaerat sunt sed\nalias aut fugiat sit autem sed est\nvoluptatem omnis possimus esse voluptatibus quis\nest aut tenetur dolor neque"
            ],
            [
                "userId": 1,
                "id": 6,
                "title": "dolorem eum magni eos aperiam quia",
                "body": "ut aspernatur corporis harum nihil quis provident sequi\nmollitia nobis aliquid molestiae\nperspiciatis et ea nemo ab reprehenderit accusantium quas\nvoluptate dolores velit et doloremque molestiae"
            ]
        ]
    }
    
    func mock_getUserInfo() -> [ResponseJSON] {
        return [
            [
                "id": 2,
                "name": "Ervin Howell",
                "username": "Antonette",
                "email": "Shanna@melissa.tv",
                "address": [
                    "street": "Victor Plains",
                    "suite": "Suite 879",
                    "city": "Wisokyburgh",
                    "zipcode": "90566-7771",
                    "geo": [
                        "lat": "-43.9509",
                        "lng": "-34.4618"
                    ]
                ],
                "phone": "010-692-6593 x09125",
                "website": "anastasia.net",
                "company": [
                    "name": "Deckow-Crist",
                    "catchPhrase": "Proactive didactic contingency",
                    "bs": "synergize scalable supply-chains"
                ]
            ]
        ]
    }
    
    func mock_getComments() -> [ResponseJSON] {
        return [
            [
                "postId": 1,
                "id": 1,
                "name": "id labore ex et quam laborum",
                "email": "Eliseo@gardner.biz",
                "body": "laudantium enim quasi est quidem magnam voluptate ipsam eos\ntempora quo necessitatibus\ndolor quam autem quasi\nreiciendis et nam sapiente accusantium"
            ],
            [
                "postId": 1,
                "id": 2,
                "name": "quo vero reiciendis velit similique earum",
                "email": "Jayne_Kuhic@sydney.com",
                "body": "est natus enim nihil est dolore omnis voluptatem numquam\net omnis occaecati quod ullam at\nvoluptatem error expedita pariatur\nnihil sint nostrum voluptatem reiciendis et"
            ],
            [
                "postId": 1,
                "id": 3,
                "name": "odio adipisci rerum aut animi",
                "email": "Nikita@garfield.biz",
                "body": "quia molestiae reprehenderit quasi aspernatur\naut expedita occaecati aliquam eveniet laudantium\nomnis quibusdam delectus saepe quia accusamus maiores nam est\ncum et ducimus et vero voluptates excepturi deleniti ratione"
            ],
            [
                "postId": 1,
                "id": 4,
                "name": "alias odio sit",
                "email": "Lew@alysha.tv",
                "body": "non et atque\noccaecati deserunt quas accusantium unde odit nobis qui voluptatem\nquia voluptas consequuntur itaque dolor\net qui rerum deleniti ut occaecati"
            ],
            [
                "postId": 1,
                "id": 5,
                "name": "vero eaque aliquid doloribus et culpa",
                "email": "Hayden@althea.biz",
                "body": "harum non quasi et ratione\ntempore iure ex voluptates in ratione\nharum architecto fugit inventore cupiditate\nvoluptates magni quo et"
            ]
        ]
    }
}

