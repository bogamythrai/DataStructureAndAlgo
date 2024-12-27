import Foundation

public struct CanJump {
    public static func canJump(_ nums: [Int]) -> Bool {
        let n = nums.count
        var goal = n-1
        for i in stride(from: n-2, through: 0, by: -1) {
            if i + nums[i] >= goal {
                goal = i
            }
        }
        return goal == 0
    }
}
