import Foundation

public struct HouseRobber {
    public static func rob(_ nums: [Int]) -> Int {
        guard nums.count > 1 else {
            return nums.isEmpty ? 0 : nums[0]
        }

        func robLinear(_ houses: [Int]) -> Int {
            var prev = 0
            var prev2 = 0

            for amount in houses {
                let temp = prev
                prev = max(prev2 + amount, prev)
                prev2 = temp
            }
            return prev
        }

        let robFirst = robLinear(Array(nums[0..<nums.count - 2]))
        let robSecond = robLinear(Array(nums[1..<nums.count - 1]))
        return max(robFirst, robSecond)
    }
}
