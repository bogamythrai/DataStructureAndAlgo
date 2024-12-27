import Foundation

public struct Solution {
    public static func aggressiveCows(_ stalls: [Int], _ cows: Int) -> Int {
        let sortedStalls = stalls.sorted()

        func canPlaceCows(_ distance: Int) -> Bool {
            var count = 1
            var lastPos = sortedStalls[0]

            for i in 1..<sortedStalls.count {
                if sortedStalls[i] - lastPos >= distance {
                    count += 1
                    lastPos = sortedStalls[i]

                    if count == cows {
                        return true
                    }
                }
            }
            return false
        }

        var low = 1
        var high = sortedStalls.last! - sortedStalls.first!
        var result = 0
        while low <= high {
            let mid = low + (high - low) / 2
            if canPlaceCows(mid) {
                result = mid
                low = mid + 1
            } else {
                high = mid - 1
            }
        }

        return result
    }
}
