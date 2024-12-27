import Foundation

public extension Solution {
    static func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        guard nums.count >= k else { return [] }
        var stack: [Int] = []
        var ans: [Int] = []
        var n = nums.count

        for r in 0..<n {
            let l = r-k+1
            while let top = stack.first, l > top {
                stack.removeFirst()
            }

            while let last = stack.last, nums[last] <= nums[r] {
                stack.removeLast()
            }
            stack.append(r)

            if r > k - 1 {
                if let top = stack.first {
                    ans.append(nums[top])
                }
            }
        }

        return ans
    }
}
