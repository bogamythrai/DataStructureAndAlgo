import Foundation

public struct SetMatrixZero {
    public static func setZeroes(_ matrix: inout [[Int]]) {
        var col0 = 1

        // First if any of the cell is 0 then max [i][0] and [0][j] as 0
        for i in 0..<matrix.count {
            for j in 0..<matrix[i].count {
                if matrix[i][j] == 0 {
                    matrix[i][0] = 0

                    if j != 0 {
                        matrix[0][j] = 0
                    } else { col0 = 0 }
                }
            }
        }

        // Traverse from (1,1) to (n-1, m-1) and set element to 0 if [i][0] or [0][j] == 0
        for i in 1..<matrix.count {
            for j in 1..<matrix[i].count {
                if matrix[i][j] != 0 {
                    if matrix[i][0] == 0 || matrix[0][j] == 0 {
                        matrix[i][j] = 0
                    }
                }
            }
        }

        if matrix[0][0] == 0 {
            for j in 0..<matrix[0].count {
                matrix[0][j] = 0
            }
        }

        if col0 == 0 {
            for i in 0..<matrix.count {
                matrix[i][0] = 0
            }
        }
    }
}
