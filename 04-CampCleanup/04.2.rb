# https://adventofcode.com/2022/day/4#part2
# Day 4: Camp Cleanup part 2
# In how many assignment pairs do the ranges overlap?

def overlap(range1, range2) 
  range1.include?(range2.first) || range1.include?(range2.last)
end

total = 0
IO.readlines('input.txt', chomp: true).each do |line|
  ranges = line.split(',').map{|elf| elf.split('-').map(&:to_i)}.map{|r| (r[0]..r[1])}
  total += 1 if overlap(ranges[0], ranges[1]) ||
                overlap(ranges[1], ranges[0])
end
puts "Total = ", total
