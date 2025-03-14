class Solution {
  void moveZeroes(List<int> nums) {
    int left = 0;

    for (int right = 1; right < nums.length; right++) {
      if (nums[left] != 0) {
        left++;
        continue;
      } else if (nums[right] != 0) {
        int temp = nums[left];
        nums[left] = nums[right];
        nums[right] = temp;
        left++;
      }
    }
  }
}
