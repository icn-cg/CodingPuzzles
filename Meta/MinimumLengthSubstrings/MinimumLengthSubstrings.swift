/*
 Minimum Length Substrings
 You are given two strings s and t. You can select any substring of string s and rearrange the characters of the selected substring. Determine the minimum length of the substring of s such that string t is a substring of the selected substring.
 Signature
 int minLengthSubstring(String s, String t)
 Input
 s and t are non-empty strings that contain less than 1,000,000 characters each
 Output
 Return the minimum length of the substring of s. If it is not possible, return -1
 Example
 s = "dcbefebce"
 t = "fd"
 output = 5
 Explanation:
 Substring "dcbef" can be rearranged to "cfdeb", "cefdb", and so on. String t is a substring of "cfdeb". Thus, the minimum length required is 5.

 *** NOTES ***
 For substrings/subarrays that don't involve summations, you probably want to use a sliding window. You want to performing an O(m) operation on each window where m is the size of the window however.
 This substring problem requires counting some permutation of the substring so counting characters using a dictionary is very valuable
 */

extension String {
    func minLengthOfRearrangedSubstring(containing substring: String) -> Int {
        let s: [Character] = Array(self)     // Convert self (input string) to an array of characters
        let t: [Character] = Array(substring) // Convert substring to an array of characters
        let minWindow = t.count              // Minimum possible window length is the length of t
        let n = s.count                      // Length of the input string
        
        // Helper function to generate a frequency dictionary for a given character array
        func freqDict(_ str: [Character]) -> [Character: Int] {
            var result: [Character: Int] = [:]
            for char in str {
                result[char, default: 0] += 1
            }
            return result
        }
        
        // Edge case: If substring t is longer than the main string s, return -1 (impossible to find such a window)
        if t.count > n {
            return -1
        }
        
        var start = 0                         // Start pointer for the sliding window
        let tDict = freqDict(t)               // Frequency dictionary of characters in t
        let requiredCount = tDict.count       // Number of unique characters in t
        var windowCount = 0                   // Number of characters in window matching the required frequency in tDict
        var windowDict = [Character: Int]()   // Frequency dictionary for the current sliding window
        var minLength = Int.max               // Initialize minimum length to the maximum possible value
        
        // Check if the windowDict already matches tDict initially (though unlikely here)
        if windowDict == tDict {
            return minWindow
        }
        
        // Slide the window through s until the end of the string
        for end in 0..<n {
            let endChar = s[end]
            
            // If endChar is in tDict, increment its count in windowDict
            if let charCount = tDict[endChar] {
                windowDict[endChar, default: 0] += 1
                // If the count of endChar in windowDict matches tDict, increment windowCount
                if windowDict[endChar] == charCount {
                    windowCount += 1
                }
            }
            
            // When windowCount matches requiredCount, the current window is valid
            while windowCount == requiredCount {
                // Update minimum length with the current valid window size
                minLength = min(minLength, end - start + 1)
                
                // Shrink the window from the start to potentially find a smaller valid window
                let startChar = s[start]
                if let charCount = tDict[startChar] {
                    // If removing startChar reduces a matching count, decrease windowCount
                    if windowDict[startChar] == charCount {
                        windowCount -= 1
                    }
                    windowDict[startChar]! -= 1 // Reduce startChar count in windowDict
                }
                start += 1 // Move start pointer forward to shrink the window
            }
        }
        
        // Return the minimum length found, or -1 if no valid window was found
        return minLength == Int.max ? -1 : minLength
    }
}
