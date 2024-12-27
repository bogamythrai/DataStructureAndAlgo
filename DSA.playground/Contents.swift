import Foundation


//let matrix = [[3],[2]]
//func spiralOrder(_ matrix: [[Int]]) -> [Int] {
//    var top = 0, bottom = matrix.count - 1, right = matrix[0].count - 1, left = 0
//    var result = [Int]()
//    while top <= bottom && left <= right {
//        for i in left...right {
//            result.append(matrix[top][i])
//        }
//        top += 1
//
//        if top <= bottom {
//            for i in top...bottom {
//                result.append(matrix[i][right])
//            }
//            right -= 1
//        }
//
//        if left <= right && top <= bottom {
//            for i in stride(from: right, through: left, by: -1) {
//                result.append(matrix[bottom][i])
//            }
//            bottom -= 1
//        }
//
//        if top <= bottom && left <= right {
//            for i in stride(from: bottom, through: top, by: -1) {
//                result.append(matrix[i][left])
//            }
//            left += 1
//        }
//    }
//    return result
//}
//print(spiralOrder(matrix))

print("start")
//func minimumTotal(_ triangle: [[Int]]) -> Int {
//    var seen: [[Int]: Int] = [:]
//
//    func dp(_ index: Int, _ row: Int) -> Int {
//        if row == triangle.count - 1 {
//            return triangle[row][index]
//        }
//
//        if let value = seen[[row, index]] {
//            return value
//        }
//        let left = dp(index, row + 1)
//        let right = dp(index+1, row + 1)
//
//        let minV = min(left, right)
//        seen[[row, index]] = triangle[row][index] + minV
//        return triangle[row][index] + minV
//    }
//
//    return dp(0, 0)
//}

//print(minimumTotal([[-10]]))


//print(Solution.lengthOfLIS([0,1,0,3,2,3]))

// 1. Elevator Scheduling System:
// 2. Task Scheduler
// 3. Airplane Seat Assignment:
// 4. Design Parking Lot System:
