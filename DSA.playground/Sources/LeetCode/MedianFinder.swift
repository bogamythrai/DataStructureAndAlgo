import Foundation

// 295. Find Median from Data Stream
public class MedianFinder {
    private var leftHeap = Heap<Int>(sort: >) // Max heap
    private var rightHeap = Heap<Int>(sort: <) // Min Heap
    init() {

    }

    public func addNum(_ num: Int) {
        if leftHeap.isEmpty || num <= leftHeap.peek()! {
            leftHeap.insert(num)
        } else {
            rightHeap.insert(num)
        }

        // balance the heaps
        if leftHeap.count > rightHeap.count + 1 {
            rightHeap.insert(leftHeap.remove()!)
        } else if rightHeap.count > leftHeap.count {
            leftHeap.insert(rightHeap.remove()!)
        }
    }

    public func findMedian() -> Double {
        if leftHeap.count == rightHeap.count {
            return Double(leftHeap.peek()! + rightHeap.peek()!) / 2.0
        } else {
            return Double(leftHeap.peek()!)
        }
    }
}

class Heap<T: Comparable> {
    var elements: [T] = []
    let sort: (T, T) -> Bool

    init(sort: @escaping (T, T) -> Bool) {
        self.sort = sort
    }

    var isEmpty: Bool { elements.isEmpty }
    var count: Int { elements.count }

    func peek() -> T? { elements.first }

    func insert(_ value: T) {
        elements.append(value)
        bubbleUp(elements.count - 1)
    }

    func remove() -> T? {
        guard !elements.isEmpty else { return nil }
        elements.swapAt(0, elements.count - 1)
        let removed = elements.removeLast()
        bubbleDown(0)
        return removed
    }

    func bubbleUp(_ index: Int) {
        var child = index
        var parent = (child - 1)/2

        while child > 0 && sort(elements[child], elements[parent]) {
            elements.swapAt(child, parent)
            child = parent
            parent = (child - 1) / 2
        }
    }

    func bubbleDown(_ index: Int) {
        var parent = index

        while true {
            let left = 2 * parent + 1
            let right = 2 * parent + 2
            var candidate = parent
            if left < count && sort(elements[left], elements[candidate]) {
                candidate = left
            }

            if right < count && sort(elements[right], elements[candidate]) {
                candidate = right
            }

            if candidate == parent { return }
            elements.swapAt(parent, candidate)
            parent = candidate
        }
    }
}
