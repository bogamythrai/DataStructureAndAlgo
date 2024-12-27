import Foundation

public extension Solution {
    static func canPartition(_ nums: [Int]) -> Bool {
        let totalSum = nums.reduce(0, +)

        if totalSum % 2 != 0 {
            return false
        }
        var target = totalSum/2
        var dp = Array(repeating: false, count: target + 1)
        dp[0] = true
        for num in nums {
            for j in stride(from: target, through: num, by: -1) {
                dp[j] = dp[j] || dp[j - num]
                print("\(j) - \(dp[j]) - \(dp[j-num])")
            }
        }
        return dp[target]
    }


    static func lengthOfLIS(_ nums: [Int]) -> Int {
        let n = nums.count
        var dp = [nums[0]]
        func binarySearch(_ dp: [Int], _ l: Int, _ r: Int, _ target: Int) -> Int {
            if l == r { return l }

            let m = (l + r) / 2
            if dp[m] == target { return m }
            return dp[m] > target ? binarySearch(dp, l, m, target) : binarySearch(dp, m+1, r, target)
        }

        for i in 1..<n {
            print(dp)
            if nums[i] > dp.last! {
                dp.append(nums[i])
            } else {
                let index = binarySearch(dp, 0, dp.count-1, nums[i])
                dp[index] = nums[i]
            }
        }

        return dp.count
    }
}
