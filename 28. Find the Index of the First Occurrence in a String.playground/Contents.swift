import Cocoa
import Foundation
import XCTest

class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        let N = haystack.count
        let M = needle.count
        
        if M <= N {
            for i in 0...N-M {
                for j in 0...M {
                    if haystack[i + j] != needle[j] {
                        break
                    }
                    
                    if j + 1 == M {
                        return i
                    }
                }
                
            }
        }
        return -1
        
//MARK: - My first variant, after that i found new solution, and understanded it
//        var output = -1
//        var indexStart = 0
//
//        for (index, char) in haystack.enumerated() {
//            print(char, indexStart)
//            if char == needle[indexStart] {
//                indexStart += 1
//            } else {
//                indexStart = char == needle[0] ? 1 : 0
////                print(char, needle[0], indexStart)
//            }
//
//            if indexStart == needle.count {
//                output = (index + 1) - needle.count
//                break
//            }
//        }
//        return output
    }
    
}

extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}

class SolutionTests: XCTestCase {
    var solution: Solution!
    override func setUp() {
        super.setUp()
        solution = Solution()
    }
    
    func test1() {
        let results = solution.strStr("sadbutsad", "sad")
        XCTAssertEqual(results, 0)
    }

    func test2() {
        let results = solution.strStr("leetcode", "leeto")
        XCTAssertEqual(results, -1)
    }

    func test3() {
        let results = solution.strStr("abderamanakomenamana", "mana")
        XCTAssertEqual(results, 6)
    }
    
    func test4() {
        let results = solution.strStr("mississippi", "issip")
        XCTAssertEqual(results, 4)
    }
    
    func test5() {
        let results = solution.strStr("aaa", "aaaa")
        XCTAssertEqual(results, -1)
    }
    
    func test6() {
        let results = solution.strStr("mississippi", "a")
        XCTAssertEqual(results, -1)
    }
}

SolutionTests.defaultTestSuite.run()

