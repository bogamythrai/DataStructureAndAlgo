import Foundation

public struct MinimumWindowSubString {
    func minWindow(_ s: String, _ t: String) -> String {
        let tChars = Array(t)
        let sChars = Array(s)
        if sChars.count < tChars.count {
            return ""
        }
        var tFreq = [Character: Int]()
        for char in tChars {
            tFreq[char, default: 0] += 1
        }
        print(tFreq)

        var windowFreq = [Character: Int]()
        var minLen = Int.max
        var have = 0, need = tFreq.count
        var startIndex = 0, left = 0

        for right in 0..<sChars.count {
            let char = sChars[right]
            windowFreq[char, default: 0] += 1
            if let requiredCount = tFreq[char], windowFreq[char] == requiredCount {
                have += 1
            }

            while have == need {
                if (right - left + 1) < minLen {
                    minLen = right - left + 1
                    startIndex = left
                }
                let leftChar = sChars[left]
                windowFreq[leftChar, default: 0] -= 1

                if let requiredCount = tFreq[leftChar], windowFreq[leftChar]! < requiredCount {
                    have -= 1
                }
                left += 1
            }
        }
        return minLen == Int.max ? "" : String(sChars[startIndex..<startIndex+minLen])
    }
}
