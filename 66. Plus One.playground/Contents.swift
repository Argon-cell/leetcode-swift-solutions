import Cocoa
import Foundation
import XCTest

class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var resultArray = digits
        resultArray[resultArray.count - 1] += 1
        
        for i in stride(from: digits.count - 1, to: -1, by: -1) {
            if i - 1 < 0 && resultArray[i] > 9 {
                resultArray[i] = 0
                resultArray.insert(1, at: 0)
                
            } else if resultArray[i] > 9 {
                resultArray[i - 1] += 1
                resultArray[i] = 0
            }
        }
        
        return resultArray
    }
}

class SolutionTests: XCTestCase {
    var solution: Solution!
    override func setUp() {
        super.setUp()
        solution = Solution()
    }
    
    func test1() {
        let results = solution.plusOne([1,2,3])
        XCTAssertEqual(results, [1,2,4])
    }

    func test2() {
        let results = solution.plusOne([4,3,2,1])
        XCTAssertEqual(results, [4,3,2,2])
    }

    func test3() {
        let results = solution.plusOne([9])
        XCTAssertEqual(results, [1,0])
    }
    
    func test4() {
        let results = solution.plusOne([7,2,8,5,0,9,1,2,9,5,3,6,6,7,3,2,8,4,3,7,9,5,7,7,4,7,4,9,4,7,0,1,1,1,7,4,0,0,6])
        XCTAssertEqual(results, [7,2,8,5,0,9,1,2,9,5,3,6,6,7,3,2,8,4,3,7,9,5,7,7,4,7,4,9,4,7,0,1,1,1,7,4,0,0,7])
    }
    
    func test5() {
        let results = solution.plusOne([9,9])
        XCTAssertEqual(results, [1,0,0])
    }
    
    func test6() {
        let results = solution.plusOne([9,9,9])
        XCTAssertEqual(results, [1,0,0,0])
    }
    
    
    
}

SolutionTests.defaultTestSuite.run()
