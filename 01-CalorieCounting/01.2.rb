calPerElf = []
cal = 0
IO.readlines('input.txt', chomp: true).each do |line|
  if line.length > 0
    cal += line.chomp.to_i
  else
    calPerElf.append cal
    cal = 0
  end
end
puts "Largest 3 total number of calories = ", calPerElf.max(3).sum()
