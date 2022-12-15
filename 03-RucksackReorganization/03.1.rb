# https://adventofcode.com/2022/day/3
# Day 3: Rucksack Reorganization
# The list of items for each rucksack is given as characters all on a single line.
# The first half of the characters represent items in the first compartment,
# while the second half of the characters represent items in the second compartment.
# Lowercase item types a through z have priorities 1 through 26.
# Uppercase item types A through Z have priorities 27 through 52.
# Find the item type that appears in both compartments of each rucksack.
# What is the sum of the priorities of those item types?

def priority(itemChar) 
  asc = itemChar.ord
  return (asc > 96) ? (asc - 96) : (asc - 38)
end

def common_char(first, second)
  first.each_char { |c|
    return c if second.include?(c)
  }
  return ''
end

total = 0
IO.readlines('input.txt', chomp: true).each do |line|
  compartmentSize = line.length / 2
  first = line[0..compartmentSize - 1]
  second = line[compartmentSize..-1]

  cc = common_char(first, second)
  #puts first, second, cc, priority(cc)
  total += priority(cc)
end
puts "Total = ", total
