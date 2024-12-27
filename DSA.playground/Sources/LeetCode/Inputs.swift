import Foundation

// MARK: -  Prefix SUM
//let model = PrefixSum(nums: [1, 2, 3, 4, 5, 6])
//model.findSumBetween(0, 3)

// MARK: -  SubArray Sum Equal
//SubArraySumEquals.subarraySum([1, 2, 3, 4, 5, 6], 5)

// MARK: - Contiguous Array
//ContiguousArray.findMaxLength(binaryArray: [0, 0, 1, 1, 0, 0, 1, 0])

// MARK: - TwoSumIIInputArraySorted
//TwoSumIIInputArraySorted.getIndicesOfTargetSum([2,3,4], target: 6)

// MARK: - ContainerWithMostWater
//ContainerWithMostWater.getMaxArea([1,8,6,2,5,4,7,3,4])

// MARK: - 3Sum
//ThreeSum.getTriplet([0,0,0])

// MARK: - MaximumAverageSubarray
//MaximumAverageSubarray.findMaxAvg([1,12,-5,-6,50,3], 5)

// MARK: - ReverseLinkedList
//ReverseLinkedList.reverseList(.default)

// MARK: - Search in Rotated Sorted Array
//SearchInRotatedSortedArray(nums: [4,5,6,7,0,1,2]).search(0)

// MARK: - MinimumInRotatedSortedArray
//MinimumInRotatedSortedArray.init(nums: [5,1,2,3,4]).findMin()

// MARK: - KthLargestElement
//KthLargestElement.init(nums: [5,1,2,3,4]).findKthLargest(2)

// MARK: - MergeIntervals
//MergeIntervals.init([[1,4],[2,3]]).mergeIntervals()

// MARK: - Matrix Traversal
// MARK: Flood Fill
// input - [[1,1,1],[1,1,0],[1,0,1]], (1,1) newColor = 2
// output - [[2,2,2],[2,2,0],[2,0,1]]

//let output = MatrixTraversal.floodFill([[0,0,0],[0,0,0]], 1, 1, 2)
//let output = MatrixTraversal.islandPerimeter([[1,1],[1,1]])

// MARK: - Back Tracking
//let output = BackTracking.permute([1])
//print(output)

//let output = LongestSubstringWithoutRepeating.lengthOfLongestSubstring("abcabcbb")


//let output = StringParenthesis.validate("{{}(){{}}")
//print(output)

// MARK: - Merge Sorting
//let output = MergeSorting.mergeSort([38, 27, 43, 3, 9, 82, 10])

// MARK: - Trapped Water
//let output = TrappingRainWater.trap([4,2,0,3,2,5])

// MARK: - Swap Nodes
//var output = SwapNodesInPairs.swapList(.default)
//repeat  {
//    print(output?.val as Any)
//    output = output?.next
//} while output?.next != nil
//print(output?.val as Any)

// MARK: - DetectSquares
//let detectSquares = DetectSquares()
//detectSquares.add([3, 10])
//detectSquares.add([11, 2])
//detectSquares.add([3, 2])
//detectSquares.count([11, 10])
//detectSquares.add([11, 2])
//detectSquares.count([11, 10])

//var input = [13, 46, 24, 52, 20, 9]
//SelectionSort.sort(&input)
//BubbleSort.sort(&input)
//InsertionSort.sort(&input)
//let output = MergeSort.sort(input)
//print(output)

//var input = [2,0,2,1,1,1,0]
//SortZeroOneTwosArray.sort(&input)
//print(input)

//let output = MajorityElement.majorityElement([2,2,3,1,1,1,2,2])
//print(output)

// MARK: - NextPermutation
//var nums = [1,3,2]
//NextPermutation.nextPermutation(&nums)
//print(nums)
//var matrix = [[1,1,1],[1,0,1],[1,1,1]]
//SetMatrixZero.setZeroes(&matrix)
//print(matrix)

// MARK: - firstNegativeInteger
//let result = firstNegativeInteger([12, -1, -7, 8, 15, 30, 16, 28], 3)
//print(result)

//let input = [-5, 8, -14, 2, 4, 12]
//let result = LongestSubArrayWithSum.findSubArray(input, -5)
//print(result)

// MARK: - findOrderOfCourses
//let numCourses = 4
//let prerequisites = [[1, 0], [2, 0], [3, 1], [3, 2]]
//let result = AdjacencyList.findOrderOfCourses(numCourses, prerequisites)
//print(result)

// MARK: - Pacific Atlantic
//let heights = [[1,2,2,3,5],[3,2,3,4,4],[2,4,5,3,1],[6,7,1,4,5],[5,1,1,2,4]]
//let output = PacificAtlantic.pacificAtlantic(heights)
//print(output)

//let output = minWindow("ADOBECODEBANC", "ABC")
//print(output)

//let output = ClimbingStairs.climbStairs(5)
//print(output)

//let output = CoinChange.coinChange([1], 0)
//print(output)

//let output = HouseRobber.rob([200,3,140,20,10])
//print(output)

//let output = CanJump.canJump([3,2,1,0,4])
//print(output)

//let output = MatrixTraversal.numIslands([["1","1","0","0","0"],["1","1","0","0","0"],["0","0","1","0","0"],["0","0","0","1","1"]])
//print(output)

//let root = TreeNode(5)        // Root node with value 1
//root.left = TreeNode(1)       // Left child with value 2
//root.right = TreeNode(4)
//root.right?.left = TreeNode(3)
//root.right?.right = TreeNode(6)

//let output = Tree.isSameTree(root, root)
//print(output)

//let output = Tree.maxPathSum(root)
//print(output)

//let output = Tree.isValidBST(root)
//print(output)

// Build Binary Tree
//let output = Tree.buildTree1([9,3,15,20,7], [9,15,7,20,3])
//print(output)

//let output = TopKElements.topKFrequent([1,1,1,2,2,3], 2)
//print(output)

//let medium = MedianFinder()
//medium.addNum(1)
//medium.addNum(2)
//medium.findMedian()
//medium.addNum(3)
//medium.findMedian()

//let output = RepeatAndMissingNumber.findErrorNums([3, 3, 1, 4])
//print(output)

//let output = Solution.minCostConnectPoints([[0,0],[2,2],[3,10],[5,2],[7,0]])
//print(output)


//let output = Solution.reversePairs([2,4,3,5,1])
//print(output)


//let output = Solution.combinationSum2([10,1,2,7,6,1,5], 8)
//print(output)

//let output = Solution.combinationSum3(2, 18)
//print(output)

//let output = Solution.letterCombinations("23")
//print(output)

//let output = subarraysWithKDistinct([2,1,2,1,2], 2)
//print(output)


//let output = Solution.longestOnes([1,1,1,0,0,0,1,1,1,1,0], 2)
//let output = Solution.longestOnes([0,0,1,1,0,0,1,1,1,0,1,1,0,0,0,1,1,1,1], 3)
//print(output)

//let output = Solution.subArrayRanges([4,-2,-3,4,1])
//print(output)


//let output = Solution.maxSlidingWindow([1,3,-1,-3,5,3,6,7], 3)
//let output = Solution.maxSlidingWindow([9,10,9,-7,-4,-8,2,-6], 5)
//print(output)

//let input: [ListNode?] = [
//    ListNode(1, ListNode(4, ListNode(5))),
//    ListNode(1, ListNode(3, ListNode(4))),
//    ListNode(2, ListNode(6))
//]

//let output = mergeKLists(input)
//print(output as Any)
