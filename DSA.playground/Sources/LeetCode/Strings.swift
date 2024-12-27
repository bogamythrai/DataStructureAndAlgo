import Foundation

public enum Strings {
    public static func encode(_ strs: [String]) -> String {
        var encodedString = ""
        for str in strs {
            encodedString += "\(str.count)#\(str)"
        }
        return encodedString
    }

    public static func decode(_ str: String) -> [String] {
        var strs: [String] = []
        var i = str.startIndex

        while i < str.endIndex {
            if let j = str[i...].firstIndex(of: "#") {
                let length = Int(str[i..<j])!
                // Move index after `#`
                let start = str.index(after: j)
                let end = str.index(start, offsetBy: length)

                strs.append(String(str[start..<end]))
                i = end
            } else {
                break
            }
        }
        return strs
    }
}
