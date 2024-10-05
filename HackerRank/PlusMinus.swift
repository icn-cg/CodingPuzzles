extension Double {
    func sixDecimalPlaces() -> String {
        return String(format: "%.6f", self)
    }
}
func plusMinus(arr: [Int]) -> Void {
    // Write your code here
        let size = Double(arr.count)
        var negatives = 0.0
        var positives = 0.0
        var zeros = 0.0
        for a in arr{
                if a > 0 {
                        positives += 1
                } else if a < 0 {
                        negatives += 1
                } else if a == 0 {
                      zeros += 1
                }
        }
        print((positives/size).sixDecimalPlaces())
        print((negatives/size).sixDecimalPlaces())
        print((zeros/size).sixDecimalPlaces())
}
