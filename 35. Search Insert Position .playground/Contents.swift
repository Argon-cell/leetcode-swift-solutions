import Cocoa
import Foundation
import XCTest


class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var foundIndex = nums.count
        for (index, num) in nums.enumerated() {
            if num == target || num > target {
                foundIndex = index
                break
            }
        }
        return foundIndex
    }
}


class SolutionTests: XCTestCase {
    var solution: Solution!
    override func setUp() {
        super.setUp()
        solution = Solution()
    }
    
    func test1() {
        let results = solution.searchInsert([1,3,5,6], 5)
        XCTAssertEqual(results, 2)
    }
    
    func test2() {
        let results = solution.searchInsert([1,3,5,6], 2)
        XCTAssertEqual(results, 1)
    }

    func test3() {
        let results = solution.searchInsert([1,3,5,6], 7)
        XCTAssertEqual(results, 4)
    }
}

SolutionTests.defaultTestSuite.run()
