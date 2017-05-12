require_relative 'simulation_game.rb'

unbeat_wins = 0
random_wins = 0
draws = 0

1000.times do

	player_1 = RandomAI.new('X')
	player_2 = UnbeatableAI.new('O')

	game = ConsoleGame.new(player_1, player_2)

	until game.check_winner || game.board.full_board?
	game.change_player
	game.get_move
	game.update_board
	end

	if game.check_winner
		if game.active_player.marker == 'X'
			random_wins += 1
		elsif game.active_player.marker == 'O'
			unbeat_wins += 1
		end
	else
		draws += 1
	end
end

win_per = (unbeat_wins / 1000.0) * 100
draw_per = (draws / 1000.0) * 100

puts "Unbeatable won #{unbeat_wins} times, with a #{win_per} win percentage."
puts "Random won #{random_wins} times."
puts "There were #{draws} draws.  That's #{draw_per} percent of games played."