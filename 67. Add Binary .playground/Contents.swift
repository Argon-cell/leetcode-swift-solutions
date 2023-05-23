import Cocoa
import Foundation
import XCTest

class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        var resultString: [Int] = []
        var remainder = 0

        var a = Array(a.reversed())
        var b = Array(b.reversed())

        
        for i in 0...(a.count > b.count ? a.count - 1 : b.count - 1) {
            if remainder == 1 {
 
                if a[optional: i] ?? "0" == "0" && b[optional: i] ?? "0" == "0" {
                    resultString.append(1)
                    remainder -= 1
                } else if a[optional: i] ?? "0" == "0" || b[optional: i] ?? "0" == "0" {
                    resultString.append(0)
                } else {
                    resultString.append(1)
                }
            } else {
                if a[optional: i] ?? "0" == "1" && b[optional: i] ?? "0" == "1" {
                    remainder += 1
                    resultString.append(0)
                } else if a[optional: i] ?? "0" == "1" || b[optional: i] ?? "0" == "1" {
                    resultString.append(1)
                } else {
                    resultString.append(0)
                }
            }
        }
        
        if remainder == 1 {
            resultString.append(1)
        }
    
        return String(resultString.reduce("", { String($0) + String($1) }).reversed())
    }
}

extension Collection {

    subscript(optional i: Index) -> Iterator.Element? {
        return self.indices.contains(i) ? self[i] : nil
    }

}

class SolutionTests: XCTestCase {
    var solution: Solution!
    override func setUp() {
        super.setUp()
        solution = Solution()
    }
    
    func test1() {
        let results = solution.addBinary("11", "1")
        XCTAssertEqual(results, "100")
    }

    func test2() {
        let results = solution.addBinary("1010", "1011")
        XCTAssertEqual(results, "10101")
    }

    func test3() {
        let results = solution.addBinary("11011011", "11101")
        XCTAssertEqual(results, "11111000")
    }
}

SolutionTests.defaultTestSuite.run()

