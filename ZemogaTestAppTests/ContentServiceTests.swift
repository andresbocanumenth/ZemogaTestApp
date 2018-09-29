//
//  ContentServiceTests.swift
//  ZemogaTestAppTests
//
//  Created by Andres on 9/29/18.
//  Copyright © 2018 Andres. All rights reserved.
//

import XCTest
@testable import ZemogaTestApp

class ContentServiceTests: XCTestCase {
    
    func testGetPost_success() {
        let contentService = MockContentService(testSuccessfull: true)
        contentService.getPosts { (result) in
            switch result {
            case .success(let posts):
                XCTAssert(posts.count == 6, "Test success")
                XCTAssertEqual(posts.first?.id, 1)
                XCTAssertEqual(posts.first?.title.isEmpty, false)
                break
            case .failure(_):
                XCTFail("Test failure")
                break
            }
        }
    }
    
    func testGetPost_failure() {
        let contentService = MockContentService(testSuccessfull: false)
        contentService.getPosts { (result) in
            switch result {
            case .success(_):
                XCTFail("Test failure")
                break
            case .failure(let error):
                XCTAssertEqual(error.message, "Generic Error")
                XCTAssertEqual(error.rawValue, 0)
                break
            }
        }
    }
    
    func testGetUserInfo_success() {
        let contentService = MockContentService(testSuccessfull: true)
        contentService.getUserInfo(By: 2) { (result) in
            switch result {
            case .success(let userInfo):
                XCTAssertEqual(userInfo.name, "Ervin Howell")
                XCTAssertEqual(userInfo.email.isEmpty, false)
                XCTAssertEqual(userInfo.email, "Shanna@melissa.tv")
                break
            case .failure(_):
                XCTFail("Test failure")
                break
            }
        }
    }
    
    func testGetUserInfo_failure() {
        let contentService = MockContentService(testSuccessfull: false)
        contentService.getUserInfo(By: 2)  { (result) in
            switch result {
            case .success(_):
                XCTFail("Test failure")
                break
            case .failure(let error):
                XCTAssertEqual(error.message, "Generic Error")
                XCTAssertEqual(error.rawValue, 0)
                break
            }
        }
    }
    
    func testComments_success() {
        let contentService = MockContentService(testSuccessfull: true)
        contentService.getComments(by: 2) { (result) in
            switch result {
            case .success(let comments):
                XCTAssertEqual(comments.first?.name.isEmpty, false)
                XCTAssertEqual(comments.first?.email.isEmpty, false)
                break
            case .failure(_):
                XCTFail("Test failure")
                break
            }
        }
    }
    
    func testComments_failure() {
        let contentService = MockContentService(testSuccessfull: false)
        contentService.getComments(by: 2)  { (result) in
            switch result {
            case .success(_):
                XCTFail("Test failure")
                break
            case .failure(let error):
                XCTAssertEqual(error.message, "Generic Error")
                XCTAssertEqual(error.rawValue, 0)
                break
            }
        }
    }
}
