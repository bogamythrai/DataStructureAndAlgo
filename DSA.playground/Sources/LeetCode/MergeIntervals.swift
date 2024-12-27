public struct MergeIntervals {
    let intervals: [[Int]]

    public init(_ intervals: [[Int]]) {
        self.intervals = intervals
    }

    public func mergeIntervals() -> [[Int]] {

        let sortedIntervals = intervals.sorted {
            $0[0] < $1[0]
        }

        var merged = [sortedIntervals[0]]

        for i in 1..<sortedIntervals.count {
            let prevVal = merged[merged.count-1][1]
            if prevVal >= sortedIntervals[i][0] {
                // merge intervals
                if prevVal <= sortedIntervals[i][1] {
                    merged[merged.count-1] = [merged[merged.count-1][0], sortedIntervals[i][1]]
                }
            } else {
                merged.append(sortedIntervals[i])
            }
        }
        return merged
    }
}

extension Solution {
    static func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var dummy = ListNode(0)
        var cur: ListNode? = dummy
        var left = list1
        var right = list2

        while left != nil && right != nil {
            if left!.val < right!.val {
                cur?.next = ListNode(left!.val)
                left = left!.next
            } else {
                cur?.next = ListNode(right!.val)
                right = right!.next
            }
            cur = cur?.next
        }

        while left != nil {
            cur?.next = ListNode(left!.val)
            left = left!.next
            cur = cur?.next
        }

        while right != nil {
            cur?.next = ListNode(right!.val)
            right = right!.next
            cur = cur?.next
        }
        return dummy.next
    }

    static func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        let n = lists.count
        guard n > 1 else { return lists.first ?? nil }

        if n == 2 {
            return Solution.mergeTwoLists(lists[0], lists[1])
        } else {
            let mid = n / 2
            let left = mergeKLists(Array(lists[0..<mid]))
            let right = mergeKLists(Array(lists[mid..<n]))
            print("left - \(String(describing: left))")
            print("right - \(String(describing: right))")
            return Solution.mergeTwoLists(left, right)
        }
    }
}

