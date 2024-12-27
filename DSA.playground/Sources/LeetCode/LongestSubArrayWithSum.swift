import Foundation

public struct LongestSubArrayWithSum {
    public static func find(_ nums: [Int], _ t: Int) -> Int {
        var prefixSum = 0
        var longestLength = 0
        var prefixSumIndices = [Int: Int]()
        prefixSumIndices[0] = -1

        for (index, num) in nums.enumerated() {
            prefixSum += num

            if let prevIndex = prefixSumIndices[prefixSum - t] {
                longestLength = max(longestLength, index - prevIndex)
            }

            if prefixSumIndices[prefixSum] == nil {
                prefixSumIndices[prefixSum] = index
            }
        }
        return longestLength
    }

    public static func findSubArray(_ nums: [Int], _ t: Int) -> [Int] {
        var prefixSum = 0
        var longestSubArray = [Int]()
        var prefixSumIndices = [Int: Int]()
        prefixSumIndices[0] = -1

        for (index, num) in nums.enumerated() {
            prefixSum += num

            if let prevIndex = prefixSumIndices[prefixSum - t] {
                if (index - prevIndex) > longestSubArray.count {
                    longestSubArray = Array(nums[(prevIndex+1)...index])
                }
            }

            if prefixSumIndices[prefixSum] == nil {
                prefixSumIndices[prefixSum] = index
            }
        }
        return longestSubArray
    }
}

//Given an array of integers nums and an integer k, return the total number of subarrays whose sum equals to k.
public struct SubArraySumEqualK {
    public func findSubArraySum(_ nums: [Int], _ t: Int) -> Int {
        var prefixSum = 0
        var count = 0
        var prefixSumFreq = [Int: Int]()
        prefixSumFreq[0] = 1

        for num in nums {
            prefixSum += num

            if prefixSumFreq[prefixSum - t] != nil {
                count += 1
            }

            prefixSumFreq[prefixSum, default: 0] += 1

        }
        return count
    }
}


func longestSubArrayWithSum(_ nums: [Int]) -> Int {
    var minimum = 0
    var maximum = nums[0]
    for num in nums {
        if num < minimum {
            minimum = num
        } else {
            maximum = max(maximum, num - minimum)
        }
    }
    return maximum
}

public func firstNegativeInteger(_ nums: [Int], _ k: Int) -> [Int] {
    var result = [Int]()
    var queue: [Int] = []

    for i in 0..<k {
        if nums[i] < 0 {
            queue.append(i)
        }
    }

    for i in k..<nums.count {

        if !queue.isEmpty {
            result.append(nums[queue[0]])
        } else {
            result.append(0)
        }

        // If queue is not empty then remove the elements until this index/
        while !queue.isEmpty && queue.first! <= (i-k) {
            queue.removeFirst()
        }

        if nums[i] < 0 {
            queue.append(i)
        }
    }

    if !queue.isEmpty {
        result.append(nums[queue[0]])
    } else {
        result.append(0)
    }

    return result
}
