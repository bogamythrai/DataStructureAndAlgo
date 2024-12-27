import Foundation

extension Solution {
    public static func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        func reqTime(_ hourly: Int) -> Int {
            var totalHours = 0
            for b in piles {
                totalHours += Int(ceilf(Float(b) / Float(hourly)))
            }
            return totalHours
        }

        func binarySearch(_ piles: [Int]) -> Int {
            var ans = 0
            var low = 0
            var high = piles[0]

            for b in piles {
                high = max(high, b)
            }

            while low < high {
                let mid = (low + high) / 2
                if reqTime(mid) < h {
                    high = mid - 1
                    ans = mid
                } else {
                    low = mid + 1
                }
            }
            return ans
        }

        return binarySearch(piles)
    }
}
