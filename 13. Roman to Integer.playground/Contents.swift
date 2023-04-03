import Cocoa

class Solution {
    let romainAlphabet: [String: Int] = [
        "I": 1,
        "V": 5,
        "X": 10,
        "L": 50,
        "C": 100,
        "D": 500,
        "M": 1000
    ]

    func romanToInt(_ s: String) -> Int {
        var result: Int = 0
        var pastNumber = 1001
        for char in s {
            var currentNumber = romainAlphabet[String(char)]!
            if currentNumber <= pastNumber {
                result += currentNumber
            } else {
                result += currentNumber - (2 * pastNumber)
            }

            pastNumber = currentNumber
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
        let results = solution.romanToInt("III")
        XCTAssertEqual(results, 3)
    }
    
    func test2() {
        let results = solution.romanToInt("LVIII")
        XCTAssertEqual(results, 58)
    }

    func test3() {
        let results = solution.romanToInt("MCMXCIV")
        XCTAssertEqual(results, 1994)
    }
}

SolutionTests.defaultTestSuite.run()

