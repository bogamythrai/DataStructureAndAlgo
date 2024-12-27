import Foundation

public struct RepeatAndMissingNumber {
    public static func findErrorNums(_ nums: [Int]) -> [Int] {
        let n = nums.count
        let s = n * (n + 1) / 2
        let s2 = n * (n + 1) * (2 * n + 1) / 6

        var actualSum = 0
        var actualSqSum = 0

        for num in nums {
            actualSum += num
            actualSqSum += num * num
        }

        // (missing-duplicate)
        let sumDiff = s - actualSum
        // (missing^2 - duplicate^2) = (missing+duplicate)(missing-duplicate)
        let sqSumDiff = s2 - actualSqSum

        // (missing+duplicate)
        let missingPlusDiff = sqSumDiff/sumDiff
        let missing = (sumDiff+missingPlusDiff) / 2
        let duplicate = (missingPlusDiff - sumDiff) / 2
        return [duplicate, missing]
    }
}
