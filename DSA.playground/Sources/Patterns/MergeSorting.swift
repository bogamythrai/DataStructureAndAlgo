import Foundation

public struct MergeSorting {
    public static func mergeSort(_ nums: [Int]) -> [Int] {
        if nums.count == 1 {
            return nums
        }
        let middle = nums.count / 2

        let leftArray = Array(nums[0..<middle])
        let rightArray = Array(nums[middle..<nums.count])

        let sortedLeft = mergeSort(leftArray)
        let sortedRight = mergeSort(rightArray)

        return merge(sortedLeft, sortedRight)
    }

    private static func merge(_ left: [Int], _ right: [Int]) -> [Int] {
        var i = 0, j = 0
        var merged = [Int]()
        while i < left.count && j < right.count {
            if left[i] < right[j] {
                merged.append(left[i])
                i += 1
            } else {
                merged.append(right[j])
                j += 1
            }
        }

        while i < left.count {
            merged.append(left[i])
            i += 1
        }
        while j < right.count {
            merged.append(right[j])
            j += 1
        }
        return merged
    }
}
