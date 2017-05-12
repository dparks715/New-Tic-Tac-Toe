require 'minitest/autorun'
require_relative '../console_game.rb'

class TestConsoleGame < Minitest::Test

	def test_players
		player_1 = Sequential.new('X')
		player_2 = RandomAI.new('O')
		game = ConsoleGame.new
		assert_equal('X', game.player_1.marker)
		assert_equal('O', game.player_2.marker)
	end

	def test_board
		player_1 = Sequential.new('X')
		player_2 = RandomAI.new('O')
		game = ConsoleGame.new
		assert_equal([' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '], game.board.ttt_board)
	end

end