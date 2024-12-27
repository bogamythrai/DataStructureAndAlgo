import Foundation

public struct KSmallPairs {
    public func kSmallestPairs(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> [[Int]] {
        var result = [[Int]]()

        if nums1.isEmpty || nums2.isEmpty {
            return result
        }

        var minHeap = [(Int, Int, Int)]()

        for i in 0..<min(nums1.count, k) {
            minHeap.append((nums1[i] + nums2[0], i, 0))
        }

        func heapify() {
            minHeap.sort { $0.0 < $1.0 }
        }

        heapify()

        while !minHeap.isEmpty && result.count < k {
            let (sum, i, j) = minHeap.removeFirst()
            result.append([nums1[i], nums2[j]])

            if j + 1 < nums2.count {
                minHeap.append((nums1[i] + nums2[j+1], i, j+1))
                heapify()
            }
        }

        return result
    }
}
