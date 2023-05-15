import Cocoa
import Foundation
import XCTest

class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        nums = nums.filter({ $0 != val })
        return nums.count
    }
}

class SolutionTests: XCTestCase {
    var solution: Solution!
    override func setUp() {
        super.setUp()
        solution = Solution()
    }
    
    func test1() {
        var array = [3,2,2,3]
        let results = solution.removeElement(&array, 3)
        XCTAssertEqual(results, 2)
    }
    
    func test2() {
        var array = [0,1,2,2,3,0,4,2]
        let results = solution.removeElement(&array, 2)
        XCTAssertEqual(results, 5)
        print(array)
    }
    
    func test3() {
        var array = [3,2,2,2]
        let results = solution.removeElement(&array, 2)
        XCTAssertEqual(results, 1)
        print(array)
    }
}

SolutionTests.defaultTestSuite.run()
