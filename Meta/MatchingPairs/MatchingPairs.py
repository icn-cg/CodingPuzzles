"""
Given two strings s and t of length N, find the maximum number of possible matching pairs in strings s and t after swapping exactly two characters within s.
 A swap is switching s[i] and s[j], where s[i] and s[j] denotes the character that is present at the ith and jth index of s, respectively. The matching pairs of the two strings are defined as the number of indices for which s[i] and t[i] are equal.
 Note: This means you must swap two characters at different indices.
 Signature
 int matchingPairs(String s, String t)
 Input
 s and t are strings of length N
 N is between 2 and 1,000,000
 Output
 Return an integer denoting the maximum number of matching pairs
 Example 1
 s = "abcd"
 t = "adcb"
 output = 4
 Explanation:
 Using 0-based indexing, and with i = 1 and j = 3, s[1] and s[3] can be swapped, making it  "adcb".
 Therefore, the number of matching pairs of s and t will be 4.
 Example 2
 s = "mno"
 t = "mno"
 output = 1
 Explanation:
 Two indices have to be swapped, regardless of which two it is, only one letter will remain the same. If i = 0 and j=1, s[0] and s[1] are swapped, making s = "nmo", which shares only "o" with t.
 
 *** NOTES ***
 You have to make a swap. If both strings are identical which means they have zero unmatched pairs, you have to break two of the pairs in a swap
 If not then you can decide how to handle based on the number of unmatches.
 If there's one unmatch, you have to break an old match. You can make a different match with the swap which would retain the one unmatch property or else you have to break an old match
 If there's two or more unmatches, you have to see if you can find one or two matches among the unmatched
"""

func matchingPairs(s: String, t: String) -> Int {
    let sArray: [Character] = Array(s)
    let tArray: [Character] = Array(t)
    let n = s.count
    
    // Case 1: No unmatched pairs (s == t)
    if s == t {
        return n - 2
    }
    
    var matching = Set<Character>()
    var unmatching = [Int]()
    
    // Identify matching and unmatching positions
    for i in 0..<n {
        if sArray[i] == tArray[i] {
            matching.insert(sArray[i])
        } else {
            unmatching.append(i)
        }
    }
    
    let unmatchingCount = unmatching.count
    
    // Case 2: One unmatched pair
    if unmatchingCount == 1 {
        let index = unmatching[0]
        if matching.contains(sArray[index]) || matching.contains(tArray[index]) {
            return n - 1
        } else {
            return n - 2
        }
    }
    
  // Case 3: Two or more unmatched pairs
  var additionalMatch = 0  // Tracks if one new match can be added
  for i in 0..<unmatchingCount {
    for j in 0..<unmatchingCount {
      if sArray[unmatching[i]] == tArray[unmatching[j]] {
          additionalMatch = 1
          if sArray[unmatching[j]] == tArray[unmatching[i]] {
              return n - unmatchingCount + 2
          }
      }
    }
  }
  return n - unmatchingCount + additionalMatch
}
