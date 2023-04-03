import Cocoa

class Solution {
    func buildArray(_ nums: [Int]) -> [Int] {
        var newArray: [Int] = []
        for i in nums {
            newArray.append(nums[i])
        }
        return newArray
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
        let results = solution.buildArray([0,2,1,5,3,4])
        XCTAssertEqual(results, [0,1,2,4,5,3])
    }
    
    func test2() {
        
        let results = solution.buildArray([5,0,1,2,3,4])
        XCTAssertEqual(results, [4,5,0,1,2,3])
    }
}

SolutionTests.defaultTestSuite.run()
