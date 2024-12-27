import Foundation

public struct ClimbingStairs {
    public static func climbStairs(_ n: Int) -> Int {
        if n == 1 { return 1 }
        if n == 2 { return 2 }

        var dp = Array(repeating: 0, count: n)
        dp[0] = 1
        dp[1] = 2

        for i in 2..<n {
            dp[i] = dp[i-2] + dp[i-1]
        }

        return dp[n-1]
    }
}
