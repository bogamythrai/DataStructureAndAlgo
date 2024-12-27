public struct SearchInRotatedSortedArray {
    let nums: [Int]
    
    public init(nums: [Int]) {
        self.nums = nums
    }
    
    public func search(_ target: Int) -> Int {
        return binaryRecursive(0, nums.count-1, target)
    }

    // [4,5,6,7,0,1,2]
    private func binaryRecursive(_ low: Int, _ high: Int, _ target: Int) -> Int {
        let mid = (low + high)/2
        if low == high {
            if nums[low] == target {
                return low
            } else {
                return 0
            }
        } else if nums[low] < nums[mid] {
            if nums[low] <= target, target < nums[mid] {
                return binaryRecursive(low, mid-1, target)
            } else {
                return binaryRecursive(mid+1, high, target)
            }
        } else if nums[low] > nums[mid] {
            if nums[mid] < target, target <= nums[high] {
                return binaryRecursive(mid+1, high, target)
            } else {
                return binaryRecursive(low, mid-1, target)
            }
        } else {
            return binaryRecursive(mid+1, high, target)
        }
    }
}

