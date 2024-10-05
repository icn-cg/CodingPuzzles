func hourglassSum(arr: [[Int]]) -> Int {
    // Write your code here
    var maxSum = Int.min
    for row in 1...4{
        for value in 1...4 {
            var currentSum = arr[row - 1][value - 1] + arr[row - 1][value]
                + arr[row - 1][value + 1] + arr[row][value] + arr[row + 1][value - 1]
                + arr[row + 1][value] + arr[row + 1][value + 1]
            maxSum = max(currentSum, maxSum)
        }
    }
    return maxSum
}
