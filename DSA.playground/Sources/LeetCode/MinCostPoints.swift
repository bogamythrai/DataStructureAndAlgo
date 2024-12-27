import Foundation

extension Solution {
    public static func minCostConnectPoints(_ points: [[Int]]) -> Int {
        var heapq: [(Int, Int)] = [(0, 0)]
        var seen = Set<Int>()
        let n = points.count
        var totalCost = 0

        func heapify() {
            heapq.sort { $0.0 < $1.0 }
        }

        while seen.count < n {
            heapify()
            let (dist, i) = heapq.removeFirst()
            if seen.contains(i) {
                continue
            }

            seen.insert(i)
            totalCost += dist
            let xi = points[i][0]
            let yi = points[i][1]

            for j in 0..<n {
                if !seen.contains(j) {
                    let xj = points[j][0]
                    let yj = points[j][1]
                    let distj = abs(xi - xj) + abs(yi - yj)
                    heapq.append((distj, j))
                }
            }
            print(seen)
        }
        return totalCost
    }
}
