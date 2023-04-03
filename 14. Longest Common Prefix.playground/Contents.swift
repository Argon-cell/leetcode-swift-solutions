import Cocoa

class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        var maxLengthWordCount = strs.max()!.count
        var newArray = strs.map { string in
            string.prefix(1)
        }
        if maxLengthWordCount >= 2 {
            for i in 2...maxLengthWordCount {
                var tempNewArray = strs.map { string in
                    string.prefix(i)
                }
                
                if Set(tempNewArray).count != 1 {
                    break
                } else {
                    newArray = tempNewArray
                }
            }
        }
        
        if Set(newArray).count == 1 {
            return String(newArray[0])
        } else {
            return ""
        }
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
        let results = solution.longestCommonPrefix(["flower","flow","flight"])
        XCTAssertEqual(results, "fl")
    }
    
    func test2() {
        let results = solution.longestCommonPrefix(["dog","racecar","car"])
        XCTAssertEqual(results, "")
    }
    
    func test3() {
        let results = solution.longestCommonPrefix([""])
        XCTAssertEqual(results, "")
    }
}

SolutionTests.defaultTestSuite.run()

