func staircase(n: Int) -> Void {
    // Write your code here
    var line = ""
    for i in 1...n {
                line += String(repeating: " ", count: n-i)
                line += String(repeating: "#", count: i)
                print(line)
                line = ""
    }
}
