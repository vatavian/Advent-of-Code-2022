# https://adventofcode.com/2022/day/5#part2
# Day 5: Supply Stacks part 2:
# Multiple crates stay in the same order when moved.

$stacks = []
$stackPositions = []

def rebuildStacks(numStacks, stackInput) 
  $stacks = Array.new(numStacks) { Array.new(0) }
  $stackPositions = (1..numStacks * 4 - 3).step(4).to_a
  # puts "Stack positions: #{$stackPositions.to_s}"
  stackInput.reverse_each do |line|
    stackAdds = $stackPositions.map{|sp| line[sp]}
    # puts "Adding to stacks: #{stackAdds.to_s}"
    stackAdds.each_with_index do |val, index|
      # puts "Add #{val} to stack #{index}"
      $stacks[index].append(val) if val != ' '
    end
  end 
  # puts "Initial Stacks: #{$stacks.to_s}"
end

stackInput = []
IO.readlines('input.txt', chomp: true).each do |line|
  if line.lstrip()[0] == '['
    stackInput.append(line)
  else
    words = line.split(' ')
    if words[0] == "1"
      numStacks = words[-1].to_i
      rebuildStacks(numStacks, stackInput)
    elsif words.length == 6
      numToMove = words[1].to_i
      moveFrom  = words[3].to_i
      moveTo    = words[5].to_i
      # puts "mv #{numToMove} frm #{moveFrom} to #{moveTo}"
      $stacks[moveTo-1].concat $stacks[moveFrom-1].slice!(-numToMove..)
      # puts "Intermediate Stacks: #{$stacks.to_s}"
    end
  end
end
# puts "Final Stacks: #{$stacks.to_s}"
puts "Top of each stack: #{$stacks.map{|st| st[-1]}}"
