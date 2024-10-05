func matchingStrings(stringList: [String], queries: [String]) -> [Int] {
    // Write your code here
    var result = [Int]()
    var frequencyDict = [String:Int]()
    for string in stringList {
        var trimmedString = string.trimmingCharacters(in: .whitespaces)
        frequencyDict[trimmedString, default: 0] += 1
    }
    for query in queries {
        var query = query.trimmingCharacters(in: .whitespaces)
        if let count = frequencyDict[query] {
            result.append(count)
        } else {
            result.append(0)
        }
    }
    return result
}
