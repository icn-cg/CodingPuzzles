func quickestWayUp(ladders: [[Int]], snakes: [[Int]]) -> Int {
    // Write your code here
    let n = 100
    var board = Array(0...n)
    for ladder in ladders {
            board[ladder[0]] = ladder[1]
    }
    for snake in snakes {
            board[snake[0]] = snake[1]
    }
    var queue = [(1,0)]
    var visited = Array(repeating: false, count: n+1)
    visited[1] = true
    var moves = 0
    
    while !queue.isEmpty {
        var (currentSquare, moves) = queue.removeFirst()
        for roll in 1...6 {
                let nextSquare = currentSquare + roll
                if nextSquare > n {
                        continue
                }
                let finalSquare = board[nextSquare]
                if finalSquare == 100 {
                        return moves + 1
                }
                if !visited[finalSquare] {
                        visited[finalSquare] = true
                        queue.append((finalSquare, moves + 1))
                }
                
        }
    }
        return -1
}
