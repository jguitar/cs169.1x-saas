class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_result(m1, m2)
  (m1.upcase == m2.upcase) or
    ((m1.upcase == 'R') and (m2.upcase == 'S')) or
    ((m1.upcase == 'S') and (m2.upcase == 'P')) or
    ((m1.upcase == 'P') and (m2.upcase == 'R'))
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

  rps_result(move1, move2) ? player1 : player2
end

def rps_tournament_winner(tournament)
  roundA, roundB = tournament
  if roundA[0].class == String
    player1 = roundA
    player2 = roundB
  else
    player1 = rps_tournament_winner(roundA)
    player2 = rps_tournament_winner(roundB)
  end

  game = []
  game << player1
  game << player2
  return rps_game_winner(game)
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

if rps_game_winner([['Test1', 'P'], ['Test2', 'P']]) == ['Test1', 'P']
  puts 'ok'
else
  puts 'error'
end

if rps_game_winner([['Test1', 'R'], ['Test2', 'S']]) == ['Test1', 'R']
  puts 'ok'
else
  puts 'error'
end

if rps_game_winner([['Test1', 'S'], ['Test2', 'P']]) == ['Test1', 'S']
  puts 'ok'
else
  puts 'error'
end

if rps_game_winner([['Test1', 'P'], ['Test2', 'R']]) == ['Test1', 'P']
  puts 'ok'
else
  puts 'error'
end

if rps_game_winner([['Test1', 'S'], ['Test2', 'R']]) == ['Test2', 'R']
  puts 'ok'
else
  puts 'error'
end

if rps_tournament_winner([[[["Armando", "P"], ["Dave", "S"]], [["Richard", "R"],  ["Michael", "S"]]], [[["Allen", "S"], ["Omer", "P"]], [["David E.", "R"], ["Richard X.", "P"]]]]) == ["Richard", "R"]
  puts 'ok'
else
  puts 'error'
end

if rps_tournament_winner([[[["Armando", "R"], ["Dave", "R"]], [["Richard", "S"],  ["Michael", "P"]]], [[["Allen", "S"], ["Omer", "R"]], [["David E.", "P"], ["Richard X.", "S"]]]]) == ["Armando", "R"]
  puts 'ok'
else
  puts 'error'
end