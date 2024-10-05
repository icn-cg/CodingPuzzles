func birthdayCakeCandles(candles: [Int]) -> Int {
    // Write your code here
    var maxHeight = 0
    var maxCount = 0
    for height in candles {
            if height > maxHeight {
                    maxHeight = height
                    maxCount = 1
                    continue
            }
            if maxHeight == height {
                    maxCount += 1
            }
    }
        return maxCount
}
