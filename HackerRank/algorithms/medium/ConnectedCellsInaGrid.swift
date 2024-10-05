func connectedCell(matrix: [[Int]]) -> Int {
    // Write your code here
    let rowCount = matrix.count
    let colCount = matrix[0].count
    
    let directions = [
        (-1, 0), (1,0), (0, -1), (0, 1),
         (-1, -1), (1,1), (1, -1), (-1, 1),
    ]
    
    var visited = Array(repeating: Array(repeating: false, count: colCount), count: rowCount)
    
    func bfs(_ row: Int, _ col: Int) -> Int {
        var queue = [(row, col)]
        visited[row][col] = true
        var regionSize = 0
        while !queue.isEmpty {
                let (row, col) = queue.removeFirst()
                regionSize += 1
                for (y, x) in directions {
                        let nextRow = row + y
                        let nextCol = col + x
                        if nextRow >= 0 && nextRow < rowCount && nextCol >= 0 && nextCol < colCount
                        && matrix[nextRow][nextCol] == 1 && !visited[nextRow][nextCol] {
                                queue.append((nextRow, nextCol))
                                visited[nextRow][nextCol] = true
                        }
                }
        }
        return regionSize
    }
    var largestRegion = 0
    for row in 0..<rowCount {
            for col in 0..<colCount {
                    if matrix[row][col] == 1 && !visited[row][col] {
                            let regionSize = bfs(row, col)
                            largestRegion = max(regionSize, largestRegion)
                    }
            }
    }
        return largestRegion
}
