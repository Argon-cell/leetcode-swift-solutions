import Cocoa

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var result: [Int] = []
        for (index, item) in nums.enumerated() {
            if nums.contains(target - item) && nums.firstIndex(of: target - item)! != index {
                result = [index, nums.firstIndex(of: target - item)!]
                break
            }
        }

        return result
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
        let results = solution.twoSum([2,7,11,15], 9)
        XCTAssertEqual(results, [0, 1])
    }
    
    func test2() {
        let results = solution.twoSum([3,2,4], 6)
        XCTAssertEqual(results, [1,2])
    }

    func test3() {
        let results = solution.twoSum([3,3], 6)
        XCTAssertEqual(results, [1,0])
    }
}

SolutionTests.defaultTestSuite.run()
