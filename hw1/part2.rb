class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_result(m1, m2)
  # YOUR CODE HERE
end

def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2

  game.each do |player|
    name, move = player
    raise NoSuchStrategyError unless move.match /(R|P|S)/i
  end

  player1, player2 = game
  name1, move1 = player1
  name2, move2 = player2

  # The rules are: R beats S; S beats P; and P beats R
  return name1 if (move1.upcase == move2.upcase)
  return name1 if (move1.upcase == 'R') and (move2.upcase == 'S')
  return name1 if (move1.upcase == 'S') and (move2.upcase == 'P')
  return name1 if (move1.upcase == 'P') and (move2.upcase == 'R')
  return name2
end

def rps_tournament_winner(tournament)
  # YOUR CODE HERE
end


# test
begin
  rps_game_winner([['Test1', 'P']])
  puts 'error'
rescue WrongNumberOfPlayersError
  puts 'ok'
end

# test
begin
  rps_game_winner([['Test1', 'P'], ['Test2', 'j']])
  puts 'error'
rescue NoSuchStrategyError
  puts 'ok'
end

if rps_game_winner([['Test1', 'P'], ['Test2', 'P']]) == 'Test1'
  puts 'ok'
else
  puts 'error'
end

if rps_game_winner([['Test1', 'R'], ['Test2', 'S']]) == 'Test1'
  puts 'ok'
else
  puts 'error'
end

if rps_game_winner([['Test1', 'S'], ['Test2', 'P']]) == 'Test1'
  puts 'ok'
else
  puts 'error'
end

if rps_game_winner([['Test1', 'P'], ['Test2', 'R']]) == 'Test1'
  puts 'ok'
else
  puts 'error'
end

if rps_game_winner([['Test1', 'S'], ['Test2', 'R']]) == 'Test2'
  puts 'ok'
else
  puts 'error'
end