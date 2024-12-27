public struct ContainerWithMostWater {
    public static func getMaxArea(_ heights: [Int]) -> Int {
        var i = 0, j = heights.count - 1, area = 0

        while i < j {
            let tempArea = min(heights[i], heights[j]) * j-i
            if tempArea > area {
                area = tempArea
            }

            if heights[i] < heights[j] { i += 1 } 
            else { j -= 1 }
        }
        print("area - \(area)")
        return area
    }
}

