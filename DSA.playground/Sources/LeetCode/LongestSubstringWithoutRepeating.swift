import Foundation

/// ABCABCD
public struct LongestSubstringWithoutRepeating {
    public static func lengthOfLongestSubstring(_ s: String) -> Int {
        var lastSeen = [Character: Int]()
        var len = 0
        var start = 0

        for (end, char) in s.enumerated() {
            if let lastIndex = lastSeen[char], lastIndex >= start {
                start = lastIndex + 1
            }

            lastSeen[char] = end

            len = max(len, end - start + 1)
        }


        return len
    }
}
