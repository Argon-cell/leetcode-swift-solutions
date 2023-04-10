import Cocoa

class Solution {
    var stack = Array<String>()
    var parentheses = ["(": ")",
                       "{": "}",
                       "[": "]"]
    
    func isValid(_ s: String) -> Bool {
        for character in s {
            if !stack.isEmpty {
                if parentheses[stack.last!] == String(character) {
                    stack.removeLast()
                } else {
                    stack.append(String(character))
                }
            } else {
                stack.append(String(character))
            }
        }
        
        if stack.isEmpty {
            return true
        } else {
            return false
        }
    }
}

import Foundation
import XCTest
class SolutionTests: XCTestCase {
    var solution: Solution!
    override func setUp() {
        super.setUp()
        solution = Solution()
    }
    
    func test1() {
        let results = solution.isValid("()")
        XCTAssertEqual(results, true)
    }
    
    func test2() {
        let results = solution.isValid("()[]{}")
        XCTAssertEqual(results, true)
    }

    func test3() {
        let results = solution.isValid("(]")
        XCTAssertEqual(results, false)
    }
}

SolutionTests.defaultTestSuite.run()
