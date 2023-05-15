import Cocoa

class Solution {
    var dict: [Int: Int] = [:]
    func removeDuplicates(_ nums: inout [Int]) -> Int {
//        for num in nums {
//            if dict[num] != nil {
//                dict[num]! += 1
//            } else {
//                dict[num] = 1
//            }
//        }
//        nums = Array(dict.keys.sorted())
//        return nums.count
        
        let len = nums.count
        guard len > 1 else { return len }
        var idx = 0
        for n in nums where n != nums[idx] {
//            print(n)
            idx += 1
            nums[idx] = n
        }
        return idx + 1
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
        var array = [1,1,2]
        let results = solution.removeDuplicates(&array)
        XCTAssertEqual(results, 2)
    }
    
    func test2() {
        var array = [0,0,1,1,1,2,2,3,3,4]
        let results = solution.removeDuplicates(&array)
        XCTAssertEqual(results, 5)
    }
    
    func test3() {
        var array = [0,0,1,1,1,2,2,3,3,4,7,9]
        let results = solution.removeDuplicates(&array)
        XCTAssertEqual(results, 5)
    }
    
    func test4() {
        var array = [0,0,1,1,3,4,5,6,7,7,7,8,9]
        let results = solution.removeDuplicates(&array)
        XCTAssertEqual(results, 5)
    }

//    func test3() {
//        let results = solution.removeDuplicates([])
//        XCTAssertEqual()
//    }
}

SolutionTests.defaultTestSuite.run()
