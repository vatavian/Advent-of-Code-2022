# https://adventofcode.com/2022/day/18
# Day 18: Boiling Boulders part 1:
# What is the surface area of your scanned lava droplet?

def sides(x, y, z)
  return [[x+1, y, z], 
          [x-1, y, z],
          [x, y+1, z], 
          [x, y-1, z],
          [x, y, z+1],
          [x, y, z-1]]
end

@boulders = Hash.new(false)

IO.readlines('input.txt', chomp: true).each do |line|
  x, y, z = line.split(',').map(&:to_i)
  @boulders[[x, y, z]] = true
end

exposed_sides = 0
@boulders.each_key {|x, y, z|
  sides(x, y, z).each{ |side| exposed_sides += 1 if !@boulders[side] }
}
puts "exposed_sides #{exposed_sides}"

