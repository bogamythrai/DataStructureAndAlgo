import Foundation

public struct NextGreaterElement {
    public static func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var result = Array(repeating: -1, count: nums1.count)
        var nextGreater = [Int: Int]()
        var stack = [Int]()

        for i in stride(from: nums2.count-1, through: 0, by: -1) {
            while !stack.isEmpty && nums2[stack.last!] <= nums2[i] {
                stack.removeLast()
            }

            if !stack.isEmpty {
                nextGreater[nums2[i]] = nums2[stack.last!]
            }

            stack.append(i)
        }

        for i in 0..<nums1.count {
             result[i] = nextGreater[nums1[i]] ?? -1
        }

        return result
    }
}
