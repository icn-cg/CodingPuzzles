func compareTriplets(a: [Int], b: [Int]) -> [Int] {
    var aPoints = 0
    var bPoints = 0
    for i in 0...2 {
        if a[i] > b[i] {
            aPoints += 1
        } else if a[i] < b[i] {
            bPoints += 1
        }
    }
    return [aPoints, bPoints]
}
