import Foundation

public struct Search2DMatrixII {
    public func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        if matrix.isEmpty || matrix[0].isEmpty {
             return false
        }

        let rows = matrix.count
        let cols = matrix[0].count

        var row = 0
        var col = cols - 1

        while row < rows && col >= 0 {
            let current = matrix[row][col]

            if current == target {
                return true
            } else if current < target {
                row += 1
            } else {
                col -= 1
            }
        }
        return false
    }
}

