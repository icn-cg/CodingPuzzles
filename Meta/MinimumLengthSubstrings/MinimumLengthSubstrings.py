"""
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
"""

def min_length_substring(s, t):
  # Write your code here
  # Convert input strings to lists of characters
    s = list(s)
    t = list(t)
    min_window = len(t)  # Minimum possible window length is the length of t
    n = len(s)           # Length of the input string

    # Helper function to generate a frequency dictionary for a given character list
    def freq_dict(str_list):
        result = {}
        for char in str_list:
            if char in result:
                result[char] += 1
            else:
                result[char] = 1
        return result

    # Edge case: If substring t is longer than s, return -1 (impossible to find such a window)
    if len(t) > n:
        return -1

    start = 0                             # Start pointer for the sliding window
    t_dict = freq_dict(t)                 # Frequency dictionary of characters in t
    required_count = len(t_dict)          # Number of unique characters in t
    window_count = 0                      # Number of characters in window matching required frequency
    window_dict = {}                      # Frequency dictionary for the current sliding window
    min_length = float('inf')             # Initialize minimum length to infinity

    # Slide the window through s until the end of the string
    for end in range(n):
        end_char = s[end]

        # If end_char is in t_dict, increment its count in window_dict
        if end_char in t_dict:
            if end_char in window_dict:
                window_dict[end_char] += 1
            else:
                window_dict[end_char] = 1

            # If count of end_char in window_dict matches t_dict, increment window_count
            if window_dict[end_char] == t_dict[end_char]:
                window_count += 1

        # When window_count matches required_count, the current window is valid
        while window_count == required_count:
            # Update minimum length with the current valid window size
            min_length = min(min_length, end - start + 1)

            # Shrink the window from the start to potentially find a smaller valid window
            start_char = s[start]
            if start_char in t_dict:
                # If removing start_char reduces a matching count, decrease window_count
                if window_dict[start_char] == t_dict[start_char]:
                    window_count -= 1
                window_dict[start_char] -= 1  # Reduce start_char count in window_dict

                # Remove the character from window_dict if its count drops to zero
                if window_dict[start_char] == 0:
                    del window_dict[start_char]

            start += 1  # Move start pointer forward to shrink the window

    # Return the minimum length found, or -1 if no valid window was found
    return min_length if min_length != float('inf') else -1
