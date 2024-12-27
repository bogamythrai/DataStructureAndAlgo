import Foundation

public struct PacificAtlantic {
    public static func pacificAtlantic(_ heights: [[Int]]) -> [[Int]] {
        let columns = heights[0].count
        let rows = heights.count
        var pacificArr = [[Int]]()
        var atlanticArr = [[Int]]()

        func dfs(_ row: Int, _ col: Int, _ visited: inout [[Int]], _ height: Int) {
            if visited.contains([row, col]) ||
                row < 0 || col < 0 || row >= rows || col >= columns ||
                heights[row][col] < height {
                return
            }

            visited.append([row, col])

            dfs(row, col + 1, &visited, heights[row][col]) // Right
            dfs(row, col - 1, &visited, heights[row][col]) // Left
            dfs(row + 1, col, &visited, heights[row][col]) // Down
            dfs(row - 1, col, &visited, heights[row][col]) // Up
        }

        // Step 1: Column wise - Mark each column with visited = 1 in pacific / Atlantic array
        for c in 0..<columns {
            // First row is adjacent to Pacific ocean
            dfs(0, c, &pacificArr, heights[0][c])

            // Last row is adjacent to Atlantic ocean
            dfs(rows - 1, c, &atlanticArr, heights[rows - 1][c])
        }

        // Step 2: Row wise
        for r in 0..<rows {
            // First row is adjacent to Pacific ocean
            dfs(r, 0, &pacificArr, heights[r][0])

            // Last row is adjacent to Atlantic ocean
            dfs(r, columns - 1, &atlanticArr, heights[r][columns - 1])
        }

        var result = [[Int]]()
        for r in 0..<rows {
            for c in 0..<columns {
                if pacificArr.contains([r, c]) && atlanticArr.contains([r, c]) {
                    result.append([r, c])
                }
            }
        }

        return result
    }
}
