import Foundation

public extension Solution {
    static func longestOnes(_ nums: [Int], _ k: Int) -> Int {
        var result = 0
        var l = 0
        var noOfZeros = 0
        for r in 0..<nums.count {
            if nums[r] == 0 {
                noOfZeros += 1
            }

            while noOfZeros > k {
                if nums[l] == 0 {
                    noOfZeros -= 1
                }
                l += 1
            }
            result = max(result, r-l+1)
        }
        return result
    }
}
