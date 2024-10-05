func g_c_d(_ a: Int, _ b: Int) -> Int {
    return b == 0 ? a : g_c_d(b,a % b)
}

func rotateLeft(d: Int, arr: [Int]) -> [Int] {
    // Write your code here
    var arr = arr
    var size = arr.count
    let d = d % size
    let gcd = g_c_d(size, d)
    
    for i in 0..<gcd {
        var temp = arr[i]
        var j = i
        while true {
            let k = (j + d) % size
            arr[j] = arr[k]
            if k == i { break }
            j = k
        }
        arr[j] = temp
    }
    return arr
}
