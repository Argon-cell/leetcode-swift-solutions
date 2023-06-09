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
    var currentNumber: Int? = nil
    
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        if head?.val == nil {
            return nil
        } else if head?.next == nil {
            return currentNumber == head?.val ? nil : head
        } else {
            if head!.val != currentNumber {
                currentNumber = head!.val
                head?.next = deleteDuplicates(head?.next)
            } else {
                return deleteDuplicates(head?.next)
            }
            
            return head
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
        let results = solution.deleteDuplicates(ListNode(1, ListNode(1, ListNode(2))))
        XCTAssertEqual(results, ListNode(1, ListNode(2)))
    }

    func test2() {
        let results = solution.deleteDuplicates(ListNode(1, ListNode(1, ListNode(2, ListNode(3, ListNode(3))))))
        XCTAssertEqual(results, ListNode(1, ListNode(2, ListNode(3))))
    }

    func test3() {
        let results = solution.deleteDuplicates(ListNode(1, ListNode(1, ListNode(1))))
        XCTAssertEqual(results, ListNode(1))
    }
}

SolutionTests.defaultTestSuite.run()
