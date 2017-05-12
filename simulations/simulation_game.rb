require_relative '../board.rb'
require_relative '../player_classes.rb'
require_relative '../unbeatable.rb'


class ConsoleGame

	attr_accessor :player_1, :player_2, :board, :active_player, :move, :input1, :input2

	def initialize(player_1, player_2)
		@player_1 = player_2
		@player_2 = player_1
		@board = Board.new	
		@active_player = player_1
	end

	def get_move
		@move = active_player.get_move(board.ttt_board)	
	end

	def update_board
		marker = active_player.marker
		if board.valid_position?(@move)
			board.update_position(@move, marker)
		else
			puts "Invalid move, please choose again"
			get_move
		end
	end

	def change_player
		if active_player == player_1
			@active_player = player_2
		else
			@active_player = player_1
		end	
	end

	def check_winner
		if board.winner?(active_player.marker)
			true
		else
			false
		end	
	end

end