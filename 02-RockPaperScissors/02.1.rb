# First char is A for Rock, B for Paper, and C for Scissors
# Second char is X for Rock, Y for Paper, and Z for Scissors
# The score for a round is the score for the shape you selected
# (1 for Rock, 2 for Paper, and 3 for Scissors)
# plus (0 if you lost, 3 if the round was a draw, and 6 if you won)
score = 0
#xyzScore = {'X': 1, 'Y': 2, 'Z': 3}
loseDrawWinScore = {
  "A X" => 3 + 1,
  "A Y" => 6 + 2,
  "A Z" => 0 + 3,
  "B X" => 0 + 1,
  "B Y" => 3 + 2,
  "B Z" => 6 + 3,
  "C X" => 6 + 1,
  "C Y" => 0 + 2,
  "C Z" => 3 + 3
}
IO.readlines('input.txt', chomp: true).each do |line|
  puts line, line.length, loseDrawWinScore[line]
  score += loseDrawWinScore[line]
end
puts "Score = ", score
