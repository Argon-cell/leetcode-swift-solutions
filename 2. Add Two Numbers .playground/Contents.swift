import Cocoa
import Foundation
import XCTest

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
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
 
class Solution {
    var additional = 0

    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 != nil || l2 != nil || additional != 0 {
            let sum = (l1 != nil ? l1!.val : 0) + (l2 != nil ? l2!.val : 0) + additional
            additional = 0
            
            if sum > 9 {
                additional += sum / 10
                return ListNode(sum % 10, addTwoNumbers(l1?.next, l2?.next))
            } else {
                return ListNode(sum, addTwoNumbers(l1?.next, l2?.next))
            }
        } else {
            return nil
        }
    }
}


class SolutionTests: XCTestCase {
    var solution: Solution!
    override func setUp() {
        super.setUp()
        solution = Solution()
    }
    
    func test1() {
        let results = solution.addTwoNumbers(ListNode(2, ListNode(4, ListNode(3))), ListNode(5, ListNode(6, ListNode(4))))
        XCTAssertEqual(results, ListNode(7, ListNode(0, ListNode(8))))
    }
    
    func test2() {
        let results = solution.addTwoNumbers(ListNode(0), ListNode(0))
        XCTAssertEqual(results, ListNode(0))
    }

    func test3() {
        let results = solution.addTwoNumbers(ListNode(9, ListNode(9, ListNode(9, ListNode(9, ListNode(9, ListNode(9, ListNode(9))))))), ListNode(9, ListNode(9, ListNode(9, ListNode(9)))))
        XCTAssertEqual(results, ListNode(8, ListNode(9, ListNode(9, ListNode(9, ListNode(0, ListNode(0, ListNode(0, ListNode(1)))))))))
    }
}

SolutionTests.defaultTestSuite.run()


