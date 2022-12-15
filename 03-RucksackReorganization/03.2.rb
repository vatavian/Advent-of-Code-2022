# https://adventofcode.com/2022/day/3#part2
# Day 3: Rucksack Reorganization
# Elves are divided into groups of three.
# Within each group of three Elves, the badge is the only item type carried by all three Elves.
# while the second half of the characters represent items in the second compartment.
# Lowercase item types a through z have priorities 1 through 26.
# Uppercase item types A through Z have priorities 27 through 52.
# Find the item type that appears in both compartments of each rucksack.
# What is the sum of the priorities of those item types?

def priority(itemChar) 
  asc = itemChar.ord
  return (asc > 96) ? (asc - 96) : (asc - 38)
end

def common_char(elves)
  elves[1].each_char { |c|
    return c if elves[2].include?(c) && elves[3].include?(c)
  }
  return ''
end

total = 0
elf = 1
elves = [nil, nil, nil, nil]
IO.readlines('input.txt', chomp: true).each do |line|
  elves[elf] = line
  elf += 1
  if elf > 3
    cc = common_char(elves)
    #puts elves, cc, priority(cc)
    total += priority(cc)

    elf = 1
    elves = [nil, nil, nil, nil]
  end
end
puts "Total = ", total
