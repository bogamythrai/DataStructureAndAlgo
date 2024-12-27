import Foundation

public extension Solution {
    static func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var ans: [[Int]] = []
        var sol: [Int] = []

        func backtracking(_ i: Int) {
            let curSum = sol.reduce(0, +)

            if curSum == target {
                ans.append(sol)
                return
            }

            if i == candidates.count || curSum > target {
                return
            }

            backtracking(i+1)

            sol.append(candidates[i])
            backtracking(i)
            sol.removeLast()
        }

        backtracking(0)
        return ans
    }

    static func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var ans: Set<[Int]> = []
        var sol: [Int] = []
        let candidates = candidates.sorted()

        func backtracking(_ i: Int) {
            let curSum = sol.reduce(0, +)

            if curSum == target {
                ans.insert(sol)
                return
            }

            if i == candidates.count || curSum > target {
                return
            }

            backtracking(i+1)

            sol.append(candidates[i])
            backtracking(i+1)
            sol.removeLast()
        }

        backtracking(0)
        return Array(ans)
    }

    static func combinationSum3(_ k: Int, _ n: Int) -> [[Int]] {
        if k > n { return [] }
        var ans = [[Int]]()
        var sol = [Int]()

        func backtracking(_ i: Int, _ curSum: Int) {
            if sol.count == k {
                if curSum == n {
                    ans.append(sol)
                }
                return
            }

            if i == 9 {
                return
            }

            backtracking(i+1, curSum)

            sol.append(i + 1)
            backtracking(i+1, curSum + (i+1))
            sol.removeLast()
        }

        backtracking(0, 0)
        return ans
    }

    static func letterCombinations(_ digits: String) -> [String] {
        let digLetters: [Int: [String]] = [
            2: ["a", "b", "c"],
            3: ["d", "e", "f"],
            4: ["g", "h", "i"],
            5: ["j", "k", "l"],
            6: ["m", "n", "o"],
            7: ["p", "q", "r", "s"],
            8: ["t", "u", "v"],
            9: ["w", "x", "y", "z"]
        ]

        var number = Int(digits) ?? 0
        var letters = [[String]]()
        while number > 0 {
            let digit = number % 10
            letters.append(digLetters[digit] ?? [])
            number = number / 10
        }

        var sol: [String] = []
        var ans: [String] = []

        func backtracking(_ i: Int) {
            if i == letters.count {
                ans.append(sol.joined(separator: ""))
                return
            }

            for letter in letters[i] {
                sol.append(letter)
                backtracking(i + 1)
                sol.removeLast()
            }
        }

        backtracking(0)
        return ans
    }
}
