import Foundation
public struct AdjacencyList {
//    // Course schedule 2
//    let numCourses = 4
//    let prerequisites = [[1, 0], [2, 0], [3, 1], [3, 2]]
//    let result = findOrder(numCourses, prerequisites)
//    print(result) // Output: [0, 1, 2, 3] or [0, 2, 1, 3]

    public static func findOrderOfCourses(_ numOfCourses: Int, _ prerequisites: [[Int]]) -> [Int] {

        var adjacencyList = [Int: [Int]]()
        var inDegree = Array(repeating: 0, count: numOfCourses)

        // Step 1: Build the graph with prerequisites
        for prerequisite in prerequisites {
            let course = prerequisite[0]
            let pre = prerequisite[1]

            // Add directed edge pre -> course
            adjacencyList[pre, default: []].append(course)
            inDegree[course] += 1
        }
        print("adjacencyList - \(adjacencyList)")
        print("inDegree - \(inDegree)")

        // Step 2: initialise queue with inDegree 0
        var queue = [Int]()
        for course in 0..<numOfCourses {
            if inDegree[course] == 0 {
                queue.append(course)
            }
        }

        // Step 3: Perform BFS (Topological Sort)
        var order = [Int]()

        while  !queue.isEmpty {
            let current = queue.removeFirst()
            order.append(current)

            // Process the neighbours of the current course
            if let neighbours = adjacencyList[current] {
                for neighbour in neighbours {
                    inDegree[neighbour] -= 1
                    if inDegree[neighbour] == 0 {
                        queue.append(neighbour)
                    }
                }
            }
        }

        // Step 5: Check if the order includes all courses
        return order.count == numOfCourses ? order : []
    }

//  // Example usage:
//  let numCourses = 4
//  let prerequisites = [[1, 0], [2, 0], [3, 1], [3, 2]]
//  printAllTopologicalSorts(numCourses, prerequisites)
    func printAllTopologicalSorts(_ numCourses: Int, _ prerequisites: [[Int]]) {
        var adjacencyList = [Int: [Int]]() // Adjacency list representation of graph
        var indegree = [Int](repeating: 0, count: numCourses) // Indegree of each vertex

        // Step 1: Build the graph and indegree array
        for prereq in prerequisites {
            let course = prereq[0]
            let pre = prereq[1]

            adjacencyList[pre, default: []].append(course)
            indegree[course] += 1
        }

        // Step 2: Helper function to perform DFS with backtracking
        var result = [Int]() // To store one possible topological order

        func dfs(_ visited: inout [Bool]) {
            var isDeadEnd = true

            // Try each unvisited course with indegree 0
            for i in 0..<numCourses {
                if !visited[i] && indegree[i] == 0 {
                    // Mark this course as visited
                    visited[i] = true
                    result.append(i)

                    // Reduce the indegree of its neighbors
                    if let neighbors = adjacencyList[i] {
                        for neighbor in neighbors {
                            indegree[neighbor] -= 1
                        }
                    }

                    // Recur to explore further courses
                    dfs(&visited)

                    // Backtrack: Restore the original state
                    visited[i] = false
                    result.removeLast()

                    if let neighbors = adjacencyList[i] {
                        for neighbor in neighbors {
                            indegree[neighbor] += 1
                        }
                    }

                    isDeadEnd = false
                }
            }

            // If all vertices are visited, we have found a valid topological sort
            if result.count == numCourses {
                print(result)
            }

            // If no course with indegree 0 is found, it indicates a dead end
        }

        // Step 3: Start the DFS with backtracking
        var visited = [Bool](repeating: false, count: numCourses)
        dfs(&visited)
    }
}
