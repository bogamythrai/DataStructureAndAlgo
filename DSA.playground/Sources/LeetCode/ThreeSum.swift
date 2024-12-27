public struct ThreeSum {
    public static func getTriplet(_ nums: [Int]) -> Set<[Int]> {
        let sortedNums = nums.sorted()
        var result = Set<[Int]>()

        for i in 0..<sortedNums.count {
            var j = i + 1
            var k = sortedNums.count - 1

            while j < k {
                let sum = sortedNums[i] + sortedNums[j] + sortedNums[k]
                if sum == 0 {
                    result.insert([sortedNums[i], sortedNums[j], sortedNums[k]])
                    j += 1
                    k -= 1
                } else if sum < 0 {
                    j += 1
                } else {
                    k -= 1
                }
            }
        }
        print(result)
        return result
    }
}

