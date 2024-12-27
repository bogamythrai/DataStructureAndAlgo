public struct MaximumAverageSubarray {
    public static func findMaxAvg(_ nums: [Int], _ k: Int) -> Double {
        guard nums.count >= k else { return 0 }
        if nums.count == k {
            return Double(nums.reduce(0, +) / k)
        }
        var resultAvg: Double = 0.0
        var i = 0
//        while i <= (nums.count - k) {
//            resultAvg = max(resultAvg, Double(nums[i..<(k+i)].reduce(0, +))/Double(k))
//            i += 1
//        }

        var sum = nums[0..<k].reduce(0, +)
        resultAvg = Double(sum)/Double(k)

        for j in k..<nums.count {
            sum += nums[j] - nums[j-k]
            resultAvg = max(resultAvg, Double(sum)/Double(k))
        }
        return resultAvg
    }
}

