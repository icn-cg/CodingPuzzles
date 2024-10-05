func miniMaxSum(arr: [Int]) -> Void {
    // Write your code here
    var arr = arr.sorted()
    print("\(arr[0...3].reduce(0, +)) \(arr[1...4].reduce(0, +))")
}
