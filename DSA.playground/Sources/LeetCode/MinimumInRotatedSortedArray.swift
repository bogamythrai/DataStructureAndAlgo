public struct MinimumInRotatedSortedArray {
    let nums: [Int]

    public init(nums: [Int]) {
        self.nums = nums
    }

    public func findMin() -> Int {
        var left = 0
        var right = nums.count - 1
        while left < right {
            let mid = left + (right - left) / 2

            if nums[mid] > nums[right] {
                left = mid + 1
            } else {
                right = mid
            }
        }
        return nums[left]
    }
}

