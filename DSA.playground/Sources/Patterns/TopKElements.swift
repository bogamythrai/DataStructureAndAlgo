import Foundation

public struct TopKElements {
    public static func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var occurenceDict = [Int: Int]()
        for num in nums {
            occurenceDict[num, default: 0] += 1
        }
        //    print(occurenceDict)
        //
        //    var array = [[Int]](repeating: [], count: nums.count)
        //    for (num, count) in occurenceDict {
        //        var curr = array[count]
        //        curr.append(num)
        //        array[count] = curr
        //    }
        //    print(array)
        //
        //    var result = [Int]()
        //    for numArray in array.reversed() {
        //        for num in numArray {
        //            result.append(num)
        //            if result.count == k {
        //                break
        //            }
        //        }
        //        if result.count == k {
        //            break
        //        }
        //    }

        var heap = [(Int, Int)]()

        for (num, freq) in occurenceDict {
            heap.append((freq, num))
            heap.sort(by: { $0.0 > $1.0 })
            if heap.count > k { heap.removeLast() }
        }

        return heap.map { $1 }
    }
}
