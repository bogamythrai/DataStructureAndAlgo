import Foundation

public extension Solution {
    public static func reversePairs(_ nums: [Int]) -> Int {
        var count = 0
        var nums = nums

        mergeSort(&nums, 0 , nums.count - 1)

        func countPairs(_ nums: inout [Int], _ low: Int, _ mid: Int, _ high: Int) {
            var j = mid + 1
            for i in low...mid {
                while j <= high && nums[i] > 2 * nums[j] {
                    j += 1
                }
                count += (j - (mid + 1))
            }
        }

        func mergeSort(_ nums: inout [Int], _ low: Int, _ high: Int) {
            if low >= high { return }

            let mid = (low + high) / 2
            mergeSort(&nums, low, mid)
            mergeSort(&nums, mid + 1, high)
            countPairs(&nums, low, mid, high)
            merge(&nums, low, mid, high)
        }

        func merge(_ nums: inout [Int], _ low: Int, _ mid: Int, _ high: Int) {
            var merged = [Int]()
            var i = low
            var j = mid + 1

            while i <= mid && j <= high {
                if nums[i] <= nums[j] {
                    merged.append(nums[i])
                    i += 1
                } else {
                    merged.append(nums[j])
                    j += 1
                }
            }

            while i <= mid {
                merged.append(nums[i])
                i += 1
            }

            while j <= high {
                merged.append(nums[j])
                j += 1
            }
            for k in low...high {
                nums[k] = merged[k - low]
            }
        }

        return count
    }
}
