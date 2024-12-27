import Foundation

struct HappyNumber {
    static func isHappy(_ n: Int) -> Bool {
        var slow = n
        var fast = n

        func getSumOfSquares(_ num: Int) -> Int {
            var sum = 0
            var number = num

            while number > 0 {
                let digit = number % 10
                sum += digit * digit
                number = number/10
            }
            return sum
        }

        repeat {
            slow = getSumOfSquares(slow)
            fast = getSumOfSquares(getSumOfSquares(fast))
            if fast == 1 {
                return true
            }
        } while slow != fast

        return false
    }
}

func findDuplicate(_ nums: [Int]) -> Int {
    var s = nums[0]
    var f = nums[0]

    repeat {
        s = nums[s]
        f = nums[nums[f]]
    } while s != f

    var ptr1 = nums[0]
    var ptr2 = s

    while ptr1 != ptr2 {
        ptr1 = nums[ptr1]
        ptr2 = nums[ptr2]
    }
    
    return ptr1
}
