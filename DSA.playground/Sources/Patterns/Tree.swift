import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() {
        self.val = 0;
        self.left = nil;
        self.right = nil;
    }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

public struct Tree {
    public static func binaryTreePaths(_ root: TreeNode?) -> [String] {
        var paths = [String]()

        func dfs(_ node: TreeNode?, _ path: String) {
            guard let node = node else {
                return
            }

            let currentPath = path.isEmpty ? "\(node.val)" : "\(path) -> \(node.val)"

            if node.left == nil && node.right == nil {
                paths.append(currentPath)
            } else {
                if node.left != nil {
                    dfs(node.left, currentPath)
                }

                if node.right != nil {
                    dfs(node.right, currentPath)
                }
            }
        }

        dfs(root, "")
        return paths
    }

    public static func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        guard let p, let q, p.val == q.val else {
            return p?.val == q?.val
        }

        return isSameTree(p.left, q.left) && isSameTree(p.right, q.right)
    }

    public static func maxPathSum(_ root: TreeNode?) -> Int {
        var maximum = 0
        func maxSum(_ node: TreeNode?) -> Int {
            guard let node else {
                return 0
            }

            let leftSum = max(maxSum(node.left), 0)
            let rightSum = max(maxSum(node.right), 0)
            maximum = max(maximum, node.val + leftSum + rightSum)
            return node.val + max(leftSum, rightSum)
        }

        let pathMax = maxSum(root)
        return max(pathMax, maximum)
    }

    public static func isValidBST(_ root: TreeNode?) -> Bool {
        func dfs(_ root: TreeNode?, _ min: Int, _ max: Int) -> Bool {
            guard let root else {
                return true
            }

            if root.val > min && root.val < max {
                return dfs(root.left, min, root.val) &&
                dfs(root.right, root.val, max)
            }
            return false
        }

        return dfs(root, Int.min, Int.max)
    }

    // inorder & postorder
    public static func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        if inorder.isEmpty && postorder.isEmpty {
            return nil
        }
        guard let nodeVal = postorder.last else {
            return nil
        }

        var node: TreeNode = TreeNode(nodeVal)
        var leftInorder = [Int]()
        var rightInorder = [Int]()
        var nodeValFound = false
        for node in inorder {
            if nodeVal == node {
                nodeValFound = true
            } else if nodeValFound {
                rightInorder.append(node)
            } else {
                leftInorder.append(node)
            }
        }

        var leftPostorder = [Int]()
        var rightPostorder = [Int]()
        for i in 0..<(postorder.count-1) {
            if leftPostorder.count < leftInorder.count {
                leftPostorder.append(postorder[i])
            } else {
                rightPostorder.append(postorder[i])
            }
        }

        node.left = buildTree(leftInorder, leftPostorder)
        node.right = buildTree(rightInorder, rightPostorder)
        return node
    }

    // inorder & post order optimised
    public static func buildTree1(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        var postIndex = postorder.count - 1
        var inIndexMap = Dictionary(uniqueKeysWithValues: inorder.enumerated().map { ($1, $0) })
        func recursive(_ inStart: Int, _ inEnd: Int) -> TreeNode? {
            if inStart > inEnd {
                return nil
            }

            let nodeVal = postorder[postIndex]
            postIndex -= 1

            guard let nodeIndex = inIndexMap[nodeVal] else {
                return nil
            }

            let node = TreeNode(nodeVal)

            // Build right sub-tree before left as we are using postorder
            node.right = recursive(nodeIndex+1, inEnd)
            node.left = recursive(inStart, nodeIndex-1)
            return node
        }

        return recursive(0, inorder.count-1)
    }

    // inorder & preorder optimised
    public static func buildTree2(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        var preIndex = 0
        var inIndexMap = Dictionary(uniqueKeysWithValues: inorder.enumerated().map { ($1, $0) })
        func recursive(_ inStart: Int, _ inEnd: Int) -> TreeNode? {
            if inStart > inEnd {
                return nil
            }

            let nodeVal = preorder[preIndex]
            preIndex += 1

            guard let nodeIndex = inIndexMap[nodeVal] else {
                return nil
            }

            let node = TreeNode(nodeVal)

            // Build left sub-tree before right as we are using preorder
            node.left = recursive(inStart, nodeIndex-1)
            node.right = recursive(nodeIndex+1, inEnd)
            return node
        }

        return recursive(0, inorder.count-1)
    }
}
