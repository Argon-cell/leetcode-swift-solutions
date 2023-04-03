import Cocoa

class Solution {
    func minPartitions(_ n: String) -> Int {
        return n.map { Int(String($0))! }.max()!
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
        let results = solution.minPartitions("32")
        XCTAssertEqual(results, 3)
    }
    
    func test2() {
        let results = solution.minPartitions("82734")
        XCTAssertEqual(results, 8)
    }
    
    func test3() {
        let results = solution.minPartitions("27346209830709182346")
        XCTAssertEqual(results, 9)
    }
}

SolutionTests.defaultTestSuite.run()
