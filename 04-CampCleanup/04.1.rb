# https://adventofcode.com/2022/day/4
# Day 4: Camp Cleanup
# Each Elf is assigned a range of section IDs.
# Each line of input is a pair of ranges for a pair of elves.
# 2-4,6-8
# In how many assignment pairs does one range fully contain the other?

def rangeIncludesRange(range1, range2) 
  range1.include?(range2.first) && range1.include?(range2.last)
end

total = 0
IO.readlines('input.txt', chomp: true).each do |line|
  ranges = line.split(',').map{|elf| elf.split('-').map(&:to_i)}.map{|r| (r[0]..r[1])}
  total += 1 if rangeIncludesRange(ranges[0], ranges[1]) ||
                rangeIncludesRange(ranges[1], ranges[0])
end
puts "Total = ", total
