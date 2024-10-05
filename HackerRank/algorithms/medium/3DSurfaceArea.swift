func surfaceArea(A: [[Int]]) -> Int {
    // Write your code here
    // front - if height[row][col] < height [row][col+1] height[row][col] - height [row][col+1]
    // rear - if height[i] > height [i-1]
    let rowCount = A.count
    let colCount = A[0].count
    var area = 0
    var current = 0
    for row in 0..<rowCount {
        for col in 0..<colCount {
            current = A[row][col]
            //calculate front
            if col == 0 {
                area += current
            } else if A[row][col] >  A[row][col - 1] {
                area += A[row][col] -  A[row][col - 1]
            }
            //calculate rear
            if col == colCount - 1 {
                area += current
            } else if A[row][col] >  A[row][col + 1] {
                area += A[row][col] -  A[row][col + 1]
            }
            // calculate left
            if row == 0 {
                area += current
            } else if A[row][col] >  A[row - 1][col] {
                area += A[row][col] -  A[row - 1][col]
            }
            // calculate right
            if row == rowCount - 1 {
                area += current
            } else if A[row][col] >  A[row + 1][col] {
                area += A[row][col] -  A[row + 1][col]
            }
            // calculate top and bottom
            area += 2
        }
    }
    return area
}
