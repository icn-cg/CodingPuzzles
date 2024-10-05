func highestValuePalindrome(s: String, n: Int, k: Int) -> String {
    var digits = Array(s)
    var left = 0
    var right = n - 1
    var remainingChanges = k
    var mismatches = Set<Int>() // Track mismatched indices for future optimization
    
    // First pass: Make the string a palindrome with minimal changes
    while left < right {
        if digits[left] != digits[right] {
            let maxDigit = max(digits[left], digits[right])
            digits[left] = maxDigit
            digits[right] = maxDigit
            remainingChanges -= 1
            mismatches.insert(left) // Keep track of mismatched indices
        }
        left += 1
        right -= 1
    }
    
    // If we used more changes than allowed, return "-1"
    if remainingChanges < 0 {
        return "-1"
    }
    
    // Second pass: Maximize the value of the palindrome
    left = 0
    right = n - 1
    while left <= right {
        if left == right {
            // Middle element in an odd-length palindrome
            if remainingChanges > 0 {
                digits[left] = "9" // Maximize the middle element if we have extra changes
            }
        } else {
            if digits[left] != "9" {
                // Check if we can maximize both digits to '9'
                if mismatches.contains(left) && remainingChanges >= 1 {
                    // If there was a mismatch, only 1 more change is needed to make both '9'
                    digits[left] = "9"
                    digits[right] = "9"
                    remainingChanges -= 1
                } else if remainingChanges >= 2 {
                    // Otherwise, 2 changes are needed to make both '9'
                    digits[left] = "9"
                    digits[right] = "9"
                    remainingChanges -= 2
                }
            }
        }
        left += 1
        right -= 1
    }
    return String(digits)
}
