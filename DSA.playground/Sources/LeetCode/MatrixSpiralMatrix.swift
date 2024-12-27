import Foundation

public struct SpiralMatrix {
    public static func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        var top = 0, bottom = matrix.count - 1, right = matrix.count - 1, left = 0
        var result = [Int]()
        while top < bottom || left < right {
            for i in left..<right {
                result.append(matrix[top][i])
            }

            top += 1

            for i in top..<bottom {
                result.append(matrix[right][i])
            }

            right -= 1

            for i in right..<left {
                result.append(matrix[bottom][i])
            }

            bottom -= 1

            for i in bottom..<top {
                result.append(matrix[right][i])
            }

            right += 1
        }
        return result
    }
}
