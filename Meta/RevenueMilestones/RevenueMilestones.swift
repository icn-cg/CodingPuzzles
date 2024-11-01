/*
 We keep track of the revenue Facebook makes every day, and we want to know on what days Facebook hits certain revenue milestones. Given an array of the revenue on each day, and an array of milestones Facebook wants to reach, return an array containing the days on which Facebook reached every milestone.
 Signature
 int[] getMilestoneDays(int[] revenues, int[] milestones)
 Input
 revenues is a length-N array representing how much revenue FB made on each day (from day 1 to day N). milestones is a length-K array of total revenue milestones.
 Output
 Return a length-K array where K_i is the day on which FB first had milestones[i] total revenue. If the milestone is never met, return -1.
 Example
 revenues = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
 milestones = [100, 200, 500]
 output = [4, 6, 10]
 Explanation
 On days 4, 5, and 6, FB has total revenue of $100, $150, and $210 respectively. Day 6 is the first time that FB has >= $200 of total revenue.
 
 *** NOTES ***
 Time complexity of this solution is O(N + K log N) where N is the number of days and K is the number of milestones
 Space complexity is O(N) for the prefix sums array
 This approach is better than the naive O(N * K) especially for large arrays. The prefix sum arrays allows you to look up total revenue for any day in constant lookup time. So because prefix sums of positive integers are sorted, we can then binary search the array for log N each time, we search K milestone times so we have K log N
 */

func getMilestoneDays(_ revenues: [Int], _ milestones: [Int]) -> [Int] {
  // Calculate prefix sums
  var prefixSums = [Int]()
  var sum = 0
  for amount in revenues {
    sum += amount
    prefixSums.append(sum)
  }

  // Binary search to find the first day where the milestone is met or exceeded
  func findMilestoneOptimized(_ amount: Int) -> Int {
    var left = 0
    var right = prefixSums.count - 1
    
    while left <= right {
      let middle = (left + right) / 2
      
      // If we find an exact match, return the 1-based index immediately
      if prefixSums[middle] >= amount {
        // Move right to potentially find an earlier day
        right = middle - 1
      } else {
        // If the current prefix sum is less than the amount, search to the right
        left = middle + 1
      }
    }
    // Return the 1-based index of the first day the milestone is met or -1 if not found
    return left < prefixSums.count ? left + 1 : -1
  }

  var milestoneDays = [Int]()
  for milestone in milestones {
    // Append the result of the binary search directly
    milestoneDays.append(findMilestoneOptimized(milestone))
  }

  return milestoneDays
}
