public extension Solution {
    static func subarraySum(_ nums: [Int], _ targetSum: Int) -> Int {
        // Create a dictionary to store the count of prefix sums.
        var prefixSumCount = [0: 1]
        var count = 0 // Initialize the count of subarrays with the target sum.
        var currentSum = 0

        for num in nums {
            // Update the running sum.
            currentSum += num

            // Calculate the difference between the current sum and the target sum.
            let diff = currentSum - targetSum

            // If the difference exists in the dictionary, add its count to the result.
            if let prefixCount = prefixSumCount[diff] {
                count += prefixCount
            }

            // Update the count for the current prefix sum.
            prefixSumCount[currentSum, default: 0] += 1
        }

        return count
    }
}

public extension Solution {
    static func subarraysWithKDistinct(_ nums: [Int], _ k: Int) -> Int {
        func atMost(_ k: Int) -> Int {
            var count = 0
            var counter = [Int: Int]()
            var l = 0

            for r in nums {
                counter[nums[r], default: 0] += 1

                while counter.count > k {
                    counter[nums[l], default: 0] -= 1
                    if counter[nums[l]] == 0 {
                        counter.removeValue(forKey: nums[l])
                    }
                    l += 1
                }

                count += r - l + 1
            }

            return count
        }

        return atMost(k) - atMost(k-1)
    }
}

public extension Solution {
    static func subArrayRanges(_ nums: [Int]) -> Int {
        let n = nums.count
        var stack: [Int] = []
        var nse = Array(repeating: n, count: n)
        var pse: [Int] = Array(repeating: -1, count: n)

        for r in 0..<n {
            while !stack.isEmpty && nums[stack.last!] > nums[r] {
                stack.removeLast()
            }
            if !stack.isEmpty {
                pse[r] = stack.last!
            }
            stack.append(r)
        }

        stack.removeAll()

        for r in stride(from: n-1, through: 0, by: -1) {
            while !stack.isEmpty && nums[stack.last!] >= nums[r] {
                stack.removeLast()
            }
            if !stack.isEmpty {
                nse[r] = stack.last!
            }
            stack.append(r)
        }

        stack.removeAll()
        var minSum = 0
        for i in 0..<n {
            let left = i - pse[i]
            let right = nse[i] - i
            minSum = minSum + (nums[i] * left * right)
        }

        // Greater Element
        var nge = Array(repeating: n, count: n)
        var pge: [Int] = Array(repeating: -1, count: n)

        for r in 0..<n {
            while !stack.isEmpty && nums[stack.last!] < nums[r] {
                stack.removeLast()
            }
            if !stack.isEmpty {
                pge[r] = stack.last!
            }
            stack.append(r)
        }

        stack.removeAll()

        for r in stride(from: n-1, through: 0, by: -1) {
            while !stack.isEmpty && nums[stack.last!] <= nums[r]  {
                stack.removeLast()
            }
            if !stack.isEmpty {
                nge[r] = stack.last!
            }
            stack.append(r)
        }

        var maxSum = 0
        for i in 0..<n {
            let left = i - pge[i]
            let right = nge[i] - i
            maxSum = maxSum + (nums[i] * left * right)
        }

        return maxSum - minSum
    }
}
