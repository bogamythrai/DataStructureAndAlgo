import Foundation

// MARK: - Flood Fill
// input - [[1,1,1],[1,1,0],[1,0,1]], (1,1) newColor = 2
// output - [[2,2,2],[2,2,0],[2,0,1]]

public struct MatrixTraversal {
    public static func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ color: Int) -> [[Int]] {
        var image = image
        let baseColor = image[sr][sc]

        if baseColor != color {
            var stack: [(Int, Int)] = [(sr, sc)]

            while !stack.isEmpty {
                let (row, col) = stack.removeLast()
                image[row][col] = color
                // Left
                if row > 0 && image[row-1][col] == baseColor {
                    stack.append((row-1, col))
                }

                // Top
                if col > 0 && image[row][col-1] == baseColor {
                    stack.append((row, col-1))
                }

                // Right
                if row < image.count - 1 && image[row+1][col] == baseColor {
                    stack.append((row+1, col))
                }

                // Bottom
                if col < image[0].count - 1 && image[row][col+1] == baseColor {
                    stack.append((row, col+1))
                }
            }
        }
        return image
    }

    // DFS Approach
    public static func islandPerimeter(_ grid: [[Int]]) -> Int {
        var grid = grid
        var perimeter = 0
        let land = 1, visited = 2

        var stack: [(Int, Int)] = [(Int, Int)]()

        // Find first land cell
        for i in 0..<grid.count {
            for j in 0..<grid[0].count {
                if grid[i][j] == 1 {
                    stack.append((i, j))  // Push the first land cell to the stack
                    break
                }
            }
            if !stack.isEmpty {
                break
            }
        }

        while !stack.isEmpty {
            let (row, col) = stack.removeLast()
            if grid[row][col] == land {
                grid[row][col] = visited
                perimeter += 4

                // Top
                if row > 0 && grid[row-1][col] == land {
                    perimeter -= 2
                    stack.append((row-1, col))
                }

                // Left
                if col > 0 && grid[row][col-1] == land {
                    perimeter -= 2
                    stack.append((row, col-1))
                }

                // Bottom
                if row < grid.count - 1 && grid[row+1][col] == land {
                    perimeter -= 2
                    stack.append((row+1, col))
                }

                // Right
                if col < grid[0].count - 1 && grid[row][col+1] == land {
                    perimeter -= 2
                    stack.append((row, col+1))
                }
            }
        }

        return perimeter
    }

    /// Non-DFS Approach
    /// - Parameter grid: [[Int]]
    /// - Returns: Perimeter of land in island
    public static func islandPerimeterNonDFS(_ grid: [[Int]]) -> Int {
        let rows = grid.count
        let cols = grid[0].count
        var perimeter = 0

        for row in 0..<rows {
            for col in 0..<cols {
                if grid[row][col] == 1 {
                    // Start with 4 sides for the current land cell
                    perimeter += 4

                    // Subtract 2 for each neighboring land cell (shared edge)
                    // Check the top neighbor
                    if row > 0 && grid[row-1][col] == 1 {
                        perimeter -= 2
                    }
                    // Check the left neighbor
                    if col > 0 && grid[row][col-1] == 1 {
                        perimeter -= 2
                    }
                }
            }
        }

        return perimeter
    }

    // Number of Islands
    public static func numIslands(_ grid: [[Character]]) -> Int {
        if grid.count == 0 || grid[0].count == 0 {
            return 0
        }
        var grid = grid
        let n = grid.count
        let m = grid[0].count
        var noOfIslands = 0
        let directions = [(0, 1), (0, -1), (1, 0), (-1, 0)]

        func dfs(_ row: Int, _ col: Int) {
            grid[row][col] = "0"
            for (x, y) in directions {
                let i = row+x
                let j = col+y
                if i >= 0 && j >= 0 && i < n && j < m
                    && grid[i][j] == "1" {
                    dfs(i, j)
                }
            }
        }

        for i in 0..<n {
            for j in 0..<m {
                if grid[i][j] == "1" {
                    noOfIslands += 1
                    dfs(i, j)
                }
            }
        }
        return noOfIslands
    }
}
