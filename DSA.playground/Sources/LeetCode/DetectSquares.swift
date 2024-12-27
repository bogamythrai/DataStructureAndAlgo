import Foundation

public class DetectSquares {
    var pointsDict: [[Int]: Int]
    var points: [[Int]]

    public init() {
        pointsDict = [:]
        points = []
    }

    public func add(_ point: [Int]) {
        points.append(point)
        pointsDict[point, default: 0] += 1
    }

    public func count(_ point: [Int]) -> Int {
        let px = point[0]
        let py = point[1]
        var result = 0

        for auxPoint in points {
            let x = auxPoint[0]
            let y = auxPoint[1]

            if abs(py-y) != abs(px-x) || x == px || y == py {
                continue
            }
            if let value1 = pointsDict[[x, py]],
                let value2 = pointsDict[[px, y]] {
                result += value1 * value2
            }
        }
        return result
    }
}
