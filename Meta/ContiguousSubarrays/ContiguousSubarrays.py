"""
You are given an array arr of N integers. For each index i, you are required to determine the number of contiguous subarrays that fulfill the following conditions:
The value at index i must be the maximum element in the contiguous subarrays, and
These contiguous subarrays must either start from or end on index i.
Signature
int[] countSubarrays(int[] arr)
Input
Array arr is a non-empty list of unique integers that range between 1 to 1,000,000,000
Size N is between 1 and 1,000,000
Output
An array where each index i contains an integer denoting the maximum number of contiguous subarrays of arr[i]
Example:
arr = [3, 4, 1, 6, 2]
output = [1, 3, 1, 5, 1]
Explanation:
For index 0 - [3] is the only contiguous subarray that starts (or ends) at index 0 with the maximum value in the subarray being 3.
For index 1 - [4], [3, 4], [4, 1]
For index 2 - [1]
For index 3 - [6], [6, 2], [1, 6], [4, 1, 6], [3, 4, 1, 6]
For index 4 - [2]
So, the answer for the above input is [1, 3, 1, 5, 1]

*** NOTES ***
It is a an array of unique integers so each subarray is also an array of unique integers. You don't have to check for equality
The subarrays have to be contiguous and start or end at the index which means we are looking at subarrays from the index to the left and the right.
You just need to count the values to the left and right that are less than the current index
"""


def count_subarrays(arr):
    # Create an empty list to store results
    results = []
    n = len(arr)
    
    # For each value in arr, count the number of elements in both directions
    # that are less than or equal to the current value
    for i in range(n):
        val = arr[i]
        left = i - 1
        right = i + 1
        count = 1
        
        # Count elements to the left that are less than or equal to `val`
        while left >= 0:
            if arr[left] > val:
                break
            count += 1
            left -= 1
            
        # Count elements to the right that are less than or equal to `val`
        while right < n:
            if arr[right] > val:
                break
            count += 1
            right += 1
            
        # Append the count to the results list
        results.append(count)
        
    return results
