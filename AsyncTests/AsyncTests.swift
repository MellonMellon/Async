//
//  AsyncTests.swift
//  AsyncTests
//
//  Created by favre on 23/10/2017.
//  Copyright © 2017 favre. All rights reserved.
//

import XCTest
@testable import Async

class AsyncTests: XCTestCase {
  
  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  func testAsyncMap() {
    let stringArray = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10",
                       "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10",
                       "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10",
                       "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10",
                       "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10",
                       "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"
    ]
    let start = CACurrentMediaTime()
    let _ = stringArray.map { str -> Int? in
      sleep(1)
      //print("convert \(str)")
      return Int(str)
    }
    let end = CACurrentMediaTime()
    print("convert in \(end - start)")
    
    let startAsync = CACurrentMediaTime()
    let _ = stringArray.async_map(iterations: stringArray.count / 2) { str -> Int? in
      sleep(1)
      //print("convert \(str)")
      return Int(str)
    }
    let endAsync = CACurrentMediaTime()
    print("Async convert in \(endAsync - startAsync)")
  }
  
  func testAsyncForEach() {
    let stringArray = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10",
                       "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10",
                       "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10",
                       "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10",
                       "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10",
                       "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"
    ]
    let start = CACurrentMediaTime()
    stringArray.forEach { str  in
      sleep(1)
      //print("forEach \(str)")
    }
    let end = CACurrentMediaTime()
    print("forEach in \(end - start)")
    
    let startAsync = CACurrentMediaTime()
    stringArray.async_forEach(iterations: stringArray.count / 2) { str in
      sleep(1)
      //print("forEach \(str)")
    }
    let endAsync = CACurrentMediaTime()
    print("Async forEach in \(endAsync - startAsync)")
  }
  
  func testParallel() {
    let stringArray = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10",
                       "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10",
                       "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10",
                       "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10",
                       "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10",
                       "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"
    ]
    
    async_parallel(
      tasks:
      {
        stringArray.forEach { _ in sleep(1) }
    },
      {
        stringArray.forEach { _ in sleep(1) }
    },
      {
        stringArray.forEach { _ in sleep(1) }
    }
    )
  }
  
}
