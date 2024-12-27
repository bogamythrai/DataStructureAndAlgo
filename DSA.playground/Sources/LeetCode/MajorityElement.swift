import Foundation

public struct MajorityElement {
    public static func majorityElement(_ nums: [Int]) -> Int {
        var maxElement = [Int: Int]()
        for num in nums {
            maxElement[num, default: 0] += 1
        }

        for (key, value) in maxElement {
            if value > nums.count/2 {
                return key
            }
        }
        return -1
    }
}

public struct MostFrequentEven {
    public static func mostFrequentEven(_ nums: [Int]) -> Int {
        var maxElement = [Int: Int]()
        for num in nums {
            maxElement[num, default: 0] += 1
        }

        for (key, value) in maxElement {
            if value > nums.count/2 {
                return key
            }
        }
        return -1
    }
}
