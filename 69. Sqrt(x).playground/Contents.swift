import Cocoa
import Foundation
import XCTest

class Solution {
    /* Force method */
//    func mySqrt(_ x: Int) -> Int {
//        var counter: Int = 1
//        while counter * counter < x {
//            counter += 1
//        }
//
//        return counter * counter > x ? counter - 1 : counter
//    }
    
    /* Binary Seaerch method */
    
    func mySqrt(_ x: Int) -> Int {
        if x == 0 { return 0 }
        if x < 4 { return 1 }
        
        var minIndex: Int = 0
        var maxIndex: Int = (x + 1) / 2
        var midIndex = (minIndex + maxIndex) / 2
        
        while maxIndex > minIndex {
            if midIndex * midIndex > x {
                maxIndex -= 1
            } else {
                minIndex += 1
            }
        
            midIndex = (minIndex + maxIndex) / 2
        }
        return midIndex * midIndex > x ? midIndex - 1 : midIndex
    }
    
}


class SolutionTests: XCTestCase {
    var solution: Solution!
    override func setUp() {
        super.setUp()
        solution = Solution()
    }
    
    func test1() {
        let results = solution.mySqrt(4)
        XCTAssertEqual(results, 2)
    }
    
    func test2() {
        let results = solution.mySqrt(8)
        XCTAssertEqual(results, 2)
    }

    func test3() {
        let results = solution.mySqrt(9)
        XCTAssertEqual(results, 3)
    }
}

SolutionTests.defaultTestSuite.run()
