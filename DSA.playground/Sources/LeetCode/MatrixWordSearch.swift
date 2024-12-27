import Foundation

public struct MatrixWordSearch {
    public static func exist(_ board: [[Character]], _ word: String) -> Bool {
        var board = board
        let chars = Array(word)
        let rows = board.count
        let cols = board[0].count

        func backtrack(_ col: Int, _ row: Int, _ index: Int) -> Bool {
            // If we have matched entire word
            if chars.count == index {
                return true
            }

            // return false if out of bounds or char doesn't match word
            if col < 0 || col >= board[0].count || row < 0 || row >= board.count ||
                board[row][col] != chars[index] {
                return false
            }

            // Fill current with dummy to mark it as visited
            let temp = board[row][col]
            board[row][col] = "#"

            // Explore all four directions
            let directions = [[0, 1], [0, -1], [1, 0], [-1, 0]]
            for direction in directions {
                let newRow = row + direction[0]
                let newCol = col + direction[1]

                if backtrack(newCol, newRow, index + 1) {
                    return true
                }
            }

            // Restore cell to original value
            board[row][col] = temp
            return false
        }

        for row in 0..<rows {
            for col in 0..<cols {
                if backtrack(col, row, 0) {
                    return true
                }
            }
        }

        return false
    }
}
