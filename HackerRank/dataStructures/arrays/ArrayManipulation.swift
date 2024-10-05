func arrayManipulation(n: Int, queries: [[Int]]) -> Int {
    // Write your code here
    var diff = [Int](Array(repeating: 0, count: n+1))
    for query in queries {
        let l = query[0] - 1
        let r = query[1] - 1
        let val = query[2]
        diff[l] += val
        if r+1 < n {
            diff[r+1] -= val
        }
    }
    var maxVal = 0
    var current = 0
    for i in 0..<n {
        current += diff[i]
        if current > maxVal {
            maxVal = current
        }
    }
    return maxVal
}
