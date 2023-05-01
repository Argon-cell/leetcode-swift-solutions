import Cocoa

public class ListNode: Equatable {
    public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        if lhs.val == rhs.val && lhs.next == rhs.next {
            return true
        } else {
            return false
        }
    }
    
    public var val: Int
    public var next: ListNode?
    
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) {
        self.val = val; self.next = next;
    }
}
    
class Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil || l2 == nil { return l1 == nil ? l2 : l1 }
        if l1!.val <= l2!.val {
            l1?.next = mergeTwoLists(l1?.next, l2)
            return l1
        } else {
            l2?.next = mergeTwoLists(l1, l2?.next)
            return l2
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
        let results = solution.mergeTwoLists(ListNode(1, ListNode(2, ListNode(4))), ListNode(1, ListNode(3, ListNode(4))))
        XCTAssertEqual(results, ListNode(1, ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(4)))))))
    }
    
    func test2() {
        let results = solution.mergeTwoLists(nil, nil)
        XCTAssertEqual(results, nil)
    }

    func test3() {
        let results = solution.mergeTwoLists(nil, ListNode(0))
        XCTAssertEqual(results, ListNode(0))
    }
}

SolutionTests.defaultTestSuite.run()
