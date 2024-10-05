func diagonalDifference(arr: [[Int]]) -> Int {
    // Write your code here
        var rightLeftDiag = 0
        var leftRightDiag = 0
        let arrLength = arr.count
        for rightPtr in 0..<arrLength{
                let leftPtr = arrLength - rightPtr - 1
                rightLeftDiag += arr[rightPtr][rightPtr]
                leftRightDiag += arr[rightPtr][leftPtr]
        }
        return abs(rightLeftDiag - leftRightDiag)
}
