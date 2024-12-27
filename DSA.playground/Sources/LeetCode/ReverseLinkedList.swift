public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

extension ListNode {
    public static var `default`: ListNode {
        let node = ListNode(10)
        node.next = ListNode(20)
        node.next?.next = ListNode(30)
        node.next?.next?.next = ListNode(40)
        node.next?.next?.next?.next = ListNode(50)
        node.next?.next?.next?.next?.next = ListNode(60)
        return node
    }
}

public struct ReverseLinkedList {
    public static func reverseList(_ node: ListNode?) -> ListNode? {
        var head = node
        var prevHead: ListNode? = nil

        repeat {
            let next = head?.next // 60 , nil
            head?.next = prevHead // -> 40, 50
            prevHead = head // 40 , 50, 60
            head = next // 50, 60, nil
            print(head?.val ?? 0)
        } while head != nil

        return prevHead
    }
}

public struct SwapNodesInPairs {
    public static func swapList(_ node: ListNode?) -> ListNode? {
        let dummy = ListNode(0)
        dummy.next = node
        var prev = dummy
        while let first = prev.next, let second = first.next {
            first.next = second.next
            second.next = first
            prev.next = second

            prev = first
        }

        return dummy.next
    }
}
