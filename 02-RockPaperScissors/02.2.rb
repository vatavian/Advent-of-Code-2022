# First char is A for Rock, B for Paper, and C for Scissors
# Second char is X to lose, Y to draw, and Z to win.
# The score for a round is the score for the shape you selected
# (1 for Rock, 2 for Paper, and 3 for Scissors)
# plus (0 if you lost, 3 if the round was a draw, and 6 if you won)
score = 0
#xyzScore = {'X': 1, 'Y': 2, 'Z': 3}
loseDrawWinScore = {
  "A X" => 0 + 3,
  "A Y" => 3 + 1,
  "A Z" => 6 + 2,
  "B X" => 0 + 1,
  "B Y" => 3 + 2,
  "B Z" => 6 + 3,
  "C X" => 0 + 2,
  "C Y" => 3 + 3,
  "C Z" => 6 + 1
}
IO.readlines('input.txt', chomp: true).each do |line|
  #puts line, line.length, loseDrawWinScore[line]
  score += loseDrawWinScore[line]
end
puts "Score = ", score
