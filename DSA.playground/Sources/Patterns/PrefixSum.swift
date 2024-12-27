public struct PrefixSum {
    let nums: [Int]

    public init(nums: [Int]) {
        self.nums = nums
    }

    public func findSumBetween(_ startIndex: Int, _ endIndex: Int) -> Int {
        guard endIndex < nums.count && startIndex < endIndex else { return 0 }
        var tempArr = nums
        for index in 1..<nums.count {
            tempArr[index] = tempArr[index-1] + nums[index]
        }
        if startIndex > 0 {
            return tempArr[endIndex] - tempArr[startIndex-1]
        } else {
            return tempArr[endIndex]
        }
    }
}

