 """
 Given two arrays A and B of length N, determine if there is a way to make A equal to B by reversing any subarrays from array B any number of times.
 
 Signature
 bool areTheyEqual(int[] arr_a, int[] arr_b)
 
 Input
 All integers in array are in the range [0, 1,000,000,000].
 
 Output
 Return true if B can be made equal to A, return false otherwise.
 Example
 A = [1, 2, 3, 4]
 B = [1, 4, 3, 2]
 output = true
 After reversing the subarray of B from indices 1 to 3, array B will equal array A.
 
 *** NOTES ***
 Note that being able to reverse any subarrays of an array any amount of time can create all permutations of the said array. The question is therefore just trying to check if both arrays are permutations of each other
 """
 
 def are_they_equal(arr_a, arr_b):
    # Function to create a dictionary of counts of each element
    def create_dict(arr):
        count_dict = {}
        for a in arr:
            if a in count_dict:
                count_dict[a] += 1
            else:
                count_dict[a] = 1
        return count_dict

    # Create the dictionaries for both arrays
    dict_a = create_dict(arr_a)
    dict_b = create_dict(arr_b)

    # Compare the dictionaries
    for key_a in dict_a:
        if key_a in dict_b:
            if dict_a[key_a] != dict_b[key_a]:
                return False
        else:
            return False

    return True
