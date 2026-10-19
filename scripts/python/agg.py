#!/usr/bin/env python3
import sys

lines = sys.stdin.read().splitlines()

nums = []
prev_num = None
warned = 0
for l in lines:
	try:
		num = float(l)
	except ValueError:
		continue
	if not warned:
		if prev_num is not None:
			if prev_num > num:
				print(f"NUMBERS NOT SORTED! {prev_num} -> {num}")
				warned = 1
	nums.append(num)
	prev_num = num

# print(lines)
# print(nums)
print("count {} num_count {} mean {} p0 {} p25 {} p50 {} p75 {} p99 {} p99.9 {} p99.99 {} p100 {}".format(
	len(lines),
	len(nums),
	sum(nums) / len(nums),
	min(nums),
	nums[0],
	nums[len(nums) * 25 // 100],
	nums[len(nums) * 50 // 100],
	nums[len(nums) * 75 // 100],
	nums[len(nums) * 99 // 100],
	nums[len(nums) * 999 // 1000],
	nums[len(nums) * 9999 // 10000],
	nums[len(nums) - 1],
	max(nums),
))
