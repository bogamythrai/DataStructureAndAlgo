import Foundation

public struct BackTracking {
    public static func permute(_ nums: [Int]) -> [[Int]] {
        var nums = nums
        var result = [[Int]]()

        func backtrack(_ start: Int) {
            if start == nums.count {
                result.append(nums)
                return
            }

            for i in start..<nums.count {
                // Swap the current element with the start
                nums.swapAt(start, i)

                // Recurse with the next starting index
                backtrack(start + 1)

                // Backtrack by swapping back
                nums.swapAt(start, i)
            }
        }

        // Start backtracking from the first index
        backtrack(0)
        return result
    }
}
