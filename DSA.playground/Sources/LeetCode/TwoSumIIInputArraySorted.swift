public struct TwoSumIIInputArraySorted {
    public static func getIndicesOfTargetSum(_ input: [Int], target: Int) -> [Int] {
        var i=0, j = input.count - 1
        while j > i {
            let sum = input[i] + input[j]
            if sum == target {
                i += 1
                j += 1
                break
            } else if sum < target {
                i += 1
            } else if sum > target {
                j -= 1
            }
        }
        return [i, j]
    }
}
