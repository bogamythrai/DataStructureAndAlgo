import Foundation

// Loop starts from 0 to N
// 1. Find min from 0(starting) to N and move it to 0
// 2. starting = starting + 1
// 3. Repeat 1 & 2
public struct SelectionSort {
    public static func sort(_ input: inout [Int]) {
        for i in 0..<input.count {
            var minIndex = i

            for j in i+1..<input.count {
                if input[minIndex] > input[j] {
                    minIndex = j
                }
            }

            input.swapAt(i, minIndex)
        }
    }
}

// Loop starts from 0 to N
// 1. Loop from 0 to N(end), Find max element of two adjacent element and swap if yes, else continue
// 2. end = end + 1
// 3. Repeat 1 & 2

public struct BubbleSort {
    public static func sort(_ input: inout [Int]) {
        if input.count == 1 { return }
        var n = input.count
        while n > 0 {
            for i in 1..<n {
                if input[i-1] > input[i] {
                    input.swapAt(i-1, i)
                }
            }
            n -= 1
        }
    }
}
// Loop starts from 0 to N
// 1. Loop starts from 0 to N
// 2. Run the loop from current element to 0th index and swap elements when any two elements meet "<"
// 3. repeat 2
public struct InsertionSort {
    public static func sort(_ input: inout [Int]) {
        for i in 0..<input.count {

            var j = i-1
            while j>=0 {
                if input[j] > input[j+1] {
                    input.swapAt(j, j+1)
                } else {
                    break
                }
                j -= 1
            }
        }
    }
}


public struct MergeSort {
    public static func sort(_ input: [Int]) -> [Int] {
        if input.count == 1 {
            return input
        }
        let midPoint = input.count/2


        let leftArr = sort(Array(input[0..<midPoint]))
        let rightArr = sort(Array(input[midPoint..<input.count]))

        return merge(leftArr, rightArr)
    }

    static func merge(_ left: [Int], _ right: [Int]) -> [Int] {
        var i = 0, j = 0
        var result = [Int]()
        while i < left.count && j < right.count {
            if left[i] < right[j] {
                result.append(left[i])
                i += 1
            } else {
                result.append(right[j])
                j += 1
            }
        }

        if i < left.count {
            for k in i..<left.count {
                result.append(left[k])
            }
        }

        if j < right.count {
            for k in j..<right.count {
                result.append(right[k])
            }
        }

        return result
    }
}

// Sorted Color
public struct SortZeroOneTwosArray {
    public static func sort(_ nums: inout [Int]) {
        var low = 0, mid = 0, high = nums.count - 1

        func swap(_ array: inout [Int], _ left: Int, _ right: Int) {
            let temp = array[left]
            array[left] = array[right]
            array[right] = temp
        }

        while mid <= high {
            if nums[mid] == 0 {
                swap(&nums, low, mid)
                low += 1
                mid += 1
            } else if nums[mid] == 1 {
                mid += 1
            } else {
                swap(&nums, mid, high)
                high -= 1
            }
        }
    }
}
