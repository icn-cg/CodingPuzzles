func dynamicArray(n: Int, queries: [[Int]]) -> [Int] {
    // Write your code here
    var arr = Array(repeating: [Int](), count: n)
    var lastAnswer = 0
    var answers = [Int]()
    for row in queries {
        let query = row[0]
        let x = row[1]
        let y = row[2]
        if query == 1 {
            let idx = (x ^ lastAnswer) % n
            arr[idx].append(y)
        }
        if query == 2 {
            let idx = (x ^ lastAnswer) % n
            lastAnswer = arr[idx][y % arr[idx].count]
            answers.append(lastAnswer)
        }
    }
    return answers
}
