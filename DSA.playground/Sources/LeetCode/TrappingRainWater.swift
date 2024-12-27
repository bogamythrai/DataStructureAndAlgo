import Foundation

public struct TrappingRainWater {
    public static func trap(_ height: [Int]) -> Int {
        var leftMax = 0
        var trappedWater = 0
        for i in 0..<height.count {
            var rightMax = 0
            for j in (i+1)..<height.count {
                if height[j] > rightMax {
                    rightMax = height[j]
                }
            }
            let pointHeight = (min(leftMax, rightMax) - height[i])
            if pointHeight > 0 {
                trappedWater += pointHeight
            }

            if height[i] > leftMax {
                leftMax = height[i]
            }
        }
        return trappedWater
    }

    public static func trap1(_ height: [Int]) -> Int {
        var left = 0
        var right = height.count - 1
        var leftMax = 0
        var rightMax = 0
        var trappedWater = 0

        while left < right {
            if height[left] < height[right] {
                if height[left] >= leftMax {
                    leftMax = height[left]
                } else {
                    trappedWater += leftMax - height[left]
                }

                left += 1
            } else {
                if height[right] >= rightMax {
                    rightMax = height[right]
                } else {
                    trappedWater += rightMax - height[right]
                }
                right -= 1
            }
        }
        return trappedWater
    }
}
