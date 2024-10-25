/*
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
 */

func areTheyEqual(arr_a: [Int], arr_b: [Int]) -> Bool {
  // Write your code here
  // Helper function to create a frequency dictionary from an array
  func frequencyDictionary(from array: [Int]) -> [Int: Int] {
      var dict = [Int: Int]()
      for element in array {
          dict[element, default: 0] += 1
      }
      return dict
  }

  // Generate frequency dictionaries for both arrays
    let dictA = frequencyDictionary(from: arr_a)
    let dictB = frequencyDictionary(from: arr_b)

  // Compare dictionaries for equality
  for (key, countA) in dictA {
      if dictB[key] != countA {
          return false
      }
  }
    
  return true
}
