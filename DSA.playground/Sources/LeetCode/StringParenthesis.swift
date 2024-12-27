import Foundation

public struct StringParenthesis {
    public enum Braces {
        case flowerBraces
        case closedBraces
        case openBraces

        var open: Character {
            switch self {
                case .flowerBraces:
                    return "{"
                case .closedBraces:
                    return "["
                case .openBraces:
                    return "("
            }
        }

        var closed: Character {
            switch self {
                case .flowerBraces:
                    return "}"
                case .closedBraces:
                    return "]"
                case .openBraces:
                    return ")"
            }
        }

        public static let matchingPairs: [Character: Character] = [
            "{": "}",
            "[": "]",
            "(": ")"
        ]
    }
    
    public static func validate(_ s: String) -> Bool {

        var stack = [Character]()

//        for char in s {
//            if char == Braces.closedBraces.closed {
//                if !stack.isEmpty && stack.removeLast() == Braces.closedBraces.open {
//                    continue
//                } else {
//                    return false
//                }
//
//            } else if char == Braces.openBraces.closed {
//                if !stack.isEmpty && stack.removeLast() == Braces.openBraces.open {
//                    continue
//                } else {
//                    return false
//                }
//
//            } else if char == Braces.flowerBraces.closed {
//                if !stack.isEmpty && stack.removeLast() == Braces.flowerBraces.open {
//                    continue
//                } else {
//                    return false
//                }
//
//            } else {
//                stack.append(char)
//            }
//        }

        for char in s {
            if let closing = Braces.matchingPairs[char] {
                // If it's an opening brace, push the corresponding closing brace
                stack.append(closing)
            } else if stack.isEmpty || stack.removeLast() != char {
                // If it's a closing brace and doesn't match the last in stack, return false
                return false
            }
        }

        return stack.isEmpty
    }
}
