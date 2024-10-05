func gridSearch(G: [String], P: [String]) -> String {
    // Write your code here
    let gridRowCount = G.count
    let gridColCount = G[0].count
    let pRowCount = P.count
    let pColCount = P[0].count
    if pRowCount > gridRowCount || pColCount > gridColCount {
            return "NO"
    }
    // convert G and P grids into 2D character arrays
    var gArray = G.map { Array($0) }
    var pArray = P.map { Array($0) }
    // search the grid for the pattern and break the pattern matching once the pattern breaks
    func searchSubMatrix(startingAt point: (Int, Int)) -> Bool {
            var startRow = point.0
            var startCol = point.1
            for pRow in 0..<pRowCount {
                let gSubRow = Array(gArray[startRow + pRow][startCol...(startCol + pColCount - 1)])
                let pSubRow = pArray[pRow]
                if gSubRow != pSubRow { return false }
                }
            return true
    }
    for row in 0...(gridRowCount-pRowCount){
            for col in 0...(gridColCount-pColCount) {
                    let gCell = gArray[row][col]
                    let pCell = pArray[0][0]
                    if gCell == pCell {
                            if searchSubMatrix(startingAt: (row, col)) {
                                    return "YES"
                            }
                    }
            }
    }
    return "NO"
    // if the pattern is found completely, return "YES"
    // return "NO" at the end
}
