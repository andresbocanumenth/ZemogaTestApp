//
//  PostManagerTests.swift
//  ZemogaTestAppTests
//
//  Created by Andres on 9/29/18.
//  Copyright © 2018 Andres. All rights reserved.
//

import XCTest
@testable import ZemogaTestApp

class PostManagerTests: XCTestCase {
    
    let postManager = PostManager()
    
    func testGetPost() {
        let waitForService = expectation(description: "testGetPost")
        
        postManager.getPosts(forceUpdate: true) { (posts) in
            XCTAssertEqual(posts.first?.viewed, false)
            XCTAssertTrue(posts.count > 20)
            XCTAssertTrue(posts[25].viewed)
            XCTAssertFalse(posts[5].viewed)
            waitForService.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
}
