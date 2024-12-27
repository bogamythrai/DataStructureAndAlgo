public struct ContiguousArray {
    public static func findMaxLength(binaryArray: [Int]) -> Int {
        var prefixSum = [0: -1]
        var currentSum = 0
        var maxLen = 0

        for i in 0..<binaryArray.count {
            currentSum += (binaryArray[i] == 1 ? 1 : -1)

            if let idx = prefixSum[currentSum] {
                maxLen = max(i-idx, maxLen)
            } else {
                prefixSum[currentSum] = i
            }
        }
        return maxLen
    }
}
