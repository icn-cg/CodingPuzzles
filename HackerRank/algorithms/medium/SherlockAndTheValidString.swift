func isValid(s: String) -> String {
    // Write your code here
    var freqMap = [Character:Int]()
    var freqValMap = [Int:Int]()
    for char in s {
        freqMap[char, default: 0] += 1
    }
    for num in freqMap.values {
        freqValMap[num, default: 0] += 1
    }
    var valFreqs = Array(freqValMap.keys)
    if valFreqs.count == 1 {
        return "YES"
    } else if valFreqs.count > 2 {
        return "NO"
    }
    let freq1 = valFreqs[0]
    let freq2 = valFreqs[1]
    if abs(freq1 - freq2) == 1 {
        if freqValMap[freq1] == 1 || freqValMap[freq2] == 1 {
            return "YES"
        }
    }
    if (freqValMap[freq1] == 1 && freq1 == 1) || (freqValMap[freq2] == 1 && freq2 == 1) {
        return "YES"
    }
    return "NO"
}
