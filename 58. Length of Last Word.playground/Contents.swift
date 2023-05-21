import Cocoa
import Foundation
import XCTest

class Solution {
    func lengthOfLastWord(_ s: String) -> Int {
        return  s.split(separator: " ").last!.count
    }
}

class SolutionTests: XCTestCase {
    var solution: Solution!
    override func setUp() {
        super.setUp()
        solution = Solution()
    }
    
    func test1() {
        let results = solution.lengthOfLastWord("Hello World")
        XCTAssertEqual(results, 5)
    }
    
    func test2() {
        let results = solution.lengthOfLastWord("   fly me   to   the moon  ")
        XCTAssertEqual(results, 4)
    }

    func test3() {
        let results = solution.lengthOfLastWord("luffy is still joyboy")
        XCTAssertEqual(results, 6)
    }
}

SolutionTests.defaultTestSuite.run()
