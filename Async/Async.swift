//
//  Async.swift
//  Async
//
//  Created by favre on 23/10/2017.
//  Copyright © 2017 favre. All rights reserved.
//

import Foundation

/**
 */
extension Array {
  
  /**
   */
  public func async_map<R>(queue: DispatchQueue = .global(), iterations: Int = 2, transform: @escaping (Element) -> R) -> [R?] {
    
    var result = Array<R?>(repeating: nil, count: count)
    queue.sync {
      DispatchQueue.concurrentPerform(iterations: iterations) { i in
        let n = self.count / iterations
        (0..<n).forEach { j in
          let index = j + n * i
          result[index] = transform(self[index])
        }
      }
    }
    
    return result
  }
  
  /**
   */
  public func async_forEach(queue: DispatchQueue = .global(), iterations: Int = 2, body: @escaping (Element) -> Void) {
    queue.sync {
      DispatchQueue.concurrentPerform(iterations: iterations) { i in
        let n = self.count / iterations
        (0..<n).forEach { j -> Void in
          let index = j + n * i
          body(self[index])
        }
      }
    }
  }
}

/**
 */
public func async_parallel(queue: DispatchQueue = .global(), iterations: Int = 2, tasks: () -> Void...) {
  tasks.async_forEach(queue: queue, iterations: iterations) { $0() }
}
