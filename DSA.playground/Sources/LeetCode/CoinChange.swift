import Foundation

public struct CoinChange {
    public static func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        var dp = [Int](repeating: amount + 1, count: amount + 1)
        dp[0] = 0

        for coin in coins {
            if coin > amount {
                continue
            }
            for i in coin...amount {
                dp[i] = min(dp[i], dp[i - coin] + 1)
            }
        }

        return dp[amount] == amount + 1 ? -1 : dp[amount]
    }
}
