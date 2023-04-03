import Cocoa

class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        String(String(x).reversed()) == String(x) ? true : false
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
        let results = solution.isPalindrome(121)
        XCTAssertEqual(results, true)
    }
    
    func test2() {
        let results = solution.isPalindrome(-121)
        XCTAssertEqual(results, false)
    }

    func test3() {
        let results = solution.isPalindrome(10)
        XCTAssertEqual(results, false)
    }
}

SolutionTests.defaultTestSuite.run()

