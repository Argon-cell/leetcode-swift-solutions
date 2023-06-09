import Cocoa
import Foundation
import XCTest

class Solution {
    var hashTable: [Int: Int] = [0: 0, 1: 1, 2: 2]
    func climbStairs(_ n: Int) -> Int {
        if hashTable[n] != nil {
            return hashTable[n]!
        } else {
            hashTable[n] = climbStairs(n - 1) + climbStairs(n - 2)
            return hashTable[n]!
        }
    }
}

print(Solution().climbStairs(45))

class SolutionTests: XCTestCase {
    var solution: Solution!
    override func setUp() {
        super.setUp()
        solution = Solution()
    }
    
    func test1() {
        let results = solution.climbStairs(2)
        XCTAssertEqual(results, 2)
    }
    
    func test2() {
        let results = solution.climbStairs(3)
        XCTAssertEqual(results, 3)
    }

    func test3() {
        let results = solution.climbStairs(4)
        XCTAssertEqual(results, 5)
    }
    
    func test4() {
        let results = solution.climbStairs(5)
        XCTAssertEqual(results, 8)
    }
    
    func test5() {
        let results = solution.climbStairs(45)
        XCTAssertEqual(results, 1836311903)
    }
}

SolutionTests.defaultTestSuite.run()
