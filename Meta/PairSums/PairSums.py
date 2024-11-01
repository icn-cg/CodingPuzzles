"""
Given a list of n integers arr[0..(n-1)], determine the number of different pairs of elements within it which sum to k.
If an integer appears in the list multiple times, each copy is considered to be different; that is, two pairs are considered different if one pair includes at least one array index which the other doesn't, even if they include the same values.
Signature
int numberOfWays(int[] arr, int k)
Input
n is in the range [1, 100,000].
Each value arr[i] is in the range [1, 1,000,000,000].
k is in the range [1, 1,000,000,000].
Output
Return the number of different pairs of elements which sum to k.
Example 1
n = 5
k = 6
arr = [1, 2, 3, 4, 3]
output = 2
The valid pairs are 2+4 and 3+3.
Example 2
n = 5
k = 6
arr = [1, 5, 3, 3, 3]
output = 4
There's one valid pair 1+5, and three different valid pairs 3+3 (the 3rd and 4th elements, 3rd and 5th elements, and 4th and 5th elements).

*** NOTES ***
You want to avoid the brute force approach of O(n^2) and use a hash map to track all elements and their frequency which will allow to do O(1) lookups of the pair
"""

import math
# Add any extra import statements you may need here


# Add any helper functions you may need here


def numberOfWays(arr, k):
    # Create a frequency dictionary to count occurrences of each element
    freq_dict = {}
    for val in arr:
        if val in freq_dict:
            freq_dict[val] += 1
        else:
            freq_dict[val] = 1

    result = 0

    # Iterate through the unique keys in the frequency dictionary
    for val in list(freq_dict.keys()):
        pair_val = k - val

        # Ensure we only process each unique pair once (val <= pair_val)
        if val <= pair_val and pair_val in freq_dict:
            val_count = freq_dict[val]

            # Count pairs where the same element is used (e.g., [3, 3])
            if val == pair_val:
                # Use combination formula to count pairs from the same element
                result += (val_count * (val_count - 1)) // 2
            else:
                # Count distinct pairs (e.g., [1, 3] and [3, 1] should be counted once)
                result += val_count * freq_dict[pair_val]

    return result
