# https://adventofcode.com/2022/day/18#part2
# Day 18: Boiling Boulders part 2:
# Now do not include internal air pockets.
# What is the exterior surface area of your scanned lava droplet?

def sides(x, y, z)
  return [[x+1, y, z], 
          [x-1, y, z],
          [x, y+1, z], 
          [x, y-1, z],
          [x, y, z+1],
          [x, y, z-1]]
end

@boulders = Hash.new(false)
@max_x = 0
@max_y = 0
@max_z = 0
@searching = Hash.new(false)
@verified_outside = Hash.new(false)

def connects_outside?(x, y, z)
  return false if @boulders[[x, y, z]]
  return false if @searching[[x, y, z]]
  return true if x < 1 || y < 1 || z < 1
  return true if x > @max_x || y > @max_y || z > @max_z
  @searching[[x, y, z]] = true
  return sides(x, y, z).any?{ |sx, sy, sz| connects_outside?(sx, sy, sz)}
end

IO.readlines('input.txt', chomp: true).each do |line|
  x, y, z = line.split(',').map(&:to_i)
  @boulders[[x, y, z]] = true
  @max_x = x if x > @max_x
  @max_y = y if y > @max_y
  @max_z = z if z > @max_z
end
puts "Bounds: x #{@max_x} y #{@max_y} z #{@max_z}"
exposed_sides = 0
@boulders.each_key {|x, y, z|
  sides(x, y, z).each do |side|
    @searching = Hash.new(false)
    if connects_outside?(*side)
      exposed_sides += 1
      @verified_outside.merge!(@searching)
    end
  end
}
puts "exposed_sides #{exposed_sides}"
# 2476 too high
