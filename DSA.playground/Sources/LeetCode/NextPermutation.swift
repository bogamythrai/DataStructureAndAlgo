import Foundation

public struct NextPermutation {
    public static func nextPermutation(_ nums: inout [Int]) {
        let len = nums.count
        var lhs = -1, rhs = -1, idx = len - 2

        while idx >= 0 {
            if nums[idx] < nums[idx+1] { lhs = idx; break}
            idx -= 1
        }

        if lhs == -1 {
            nums = nums.reversed()
            return
        }

        idx = len - 1
        while idx > lhs {
            rhs = idx
            if nums[idx] > nums[lhs] {
                break
            }
            idx -= 1
        }
        nums.swapAt(lhs, rhs)
        let revNums = nums[(lhs + 1)...(len - 1)].reversed()
        nums.replaceSubrange((lhs + 1)..<len, with: revNums)
    }
}
