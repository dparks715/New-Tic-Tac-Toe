require 'minitest/autorun'
require_relative '../board_app.rb'

class TestBoard < Minitest::Test

	def test_new_board
		board = Board.new(3)
		array = *(1..9)
		assert_equal(array, board.ttt_board)
	end

	def test_new_board_size_3
		board = Board.new(3)
		assert_equal([1,2,3,4,5,6,7,8,9], board.ttt_board)
	end

	def test_new_board_size_4
		board = Board.new(4)
		assert_equal([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16], board.ttt_board)
	end

	def test_new_board_size_27
		board = Board.new(27)
		assert_equal(729, board.ttt_board.length)
	end

	def test_update_first_position
		board = Board.new(3)
		board.update_position(0, 'X')
		assert_equal(['X', 2, 3, 4, 5, 6, 7, 8, 9], board.ttt_board)
	end

	def test_first_x_and_second_o
		board = Board.new(3)
		board.update_position(0, 'X')
		board.update_position(1, 'O')
		assert_equal(['X', 'O', 3, 4, 5, 6, 7, 8, 9], board.ttt_board)
	
	end

	def test_update_partial_board_at_last_position
		board = Board.new(3)
		board.ttt_board = ['X', 'O', ' ', 'X', ' ', 'O', ' ', 'X', ' ']
		board.update_position(8, 'X')
		assert_equal(['X', 'O', ' ', 'X', ' ', 'O', ' ', 'X', 'X'], board.ttt_board)
	end

	def test_check_if_position_is_open
		board = Board.new(3)
		board.ttt_board = ['X', 'O', 3, 'X', 5, 'O', 7, 'X', 9]
		assert_equal(true, board.valid_position?(2))
		assert_equal(false, board.valid_position?(1))
		assert_equal(true, board.valid_position?(4))
	end

	def test_board_full_false
		board = Board.new(3)
		board.ttt_board = ['X', 'O', 'O', 'X', 5, 'O', 'O', 'X', 'X']
		assert_equal(false, board.full_board?)	
	end

	def test_board_full_true
		board = Board.new(3)
		board.ttt_board = ['X', 'O', 'O', 'X', 'X', 'O', 'O', 'X', 'X']
		assert_equal(true, board.full_board?)	
	end

	def test_valid_input
		board = Board.new(3)
		assert_equal(false, board.valid_input?('m'))
		assert_equal(true, board.valid_input?('X'))
		assert_equal(true, board.valid_input?('x'))
		assert_equal(true, board.valid_input?('O'))
		assert_equal(true, board.valid_input?('o'))
		assert_equal(false, board.valid_input?(''))
		assert_equal(false, board.valid_input?('*'))
	end

# WINNING COMBO TESTS

	def test_for_winner_at_012_X
		board = Board.new(3)
		marker = 'X'
		board.ttt_board = ['X', 'X', 'X', 'O', 'X', 'O', 'O', 'X', 'X']
		assert_equal(true, board.winner?(marker))	
	end

	def test_for_winner_at_012_O
		board = Board.new(3)
		marker = 'O'
		board.ttt_board = ['O', 'O', 'O', 'O', 'X', 'O', 'O', 'X', 'X']
		assert_equal(true, board.winner?(marker))	
	end

	def test_for_no_winner
		board = Board.new(3)
		marker = 'X'
		board.ttt_board = ['X', 'O', 'X', 'O', 'X', 'O', 'O', 'X', 'O']
		assert_equal(false, board.winner?(marker))	
	end

	def test_for_winner_at_345_O
		board = Board.new(3)
		marker = 'O'
		board.ttt_board = ['X', 'O', 'X', 'O', 'O', 'O', 'O', 'X', 'X']
		assert_equal(true, board.winner?(marker))	
	end

	def test_for_winner_at_678_X
		board = Board.new(3)
		marker = 'X'
		board.ttt_board = ['X', 'O', 'O', 'O', ' ', 'O', 'X', 'X', 'X']
		assert_equal(true, board.winner?(marker))	
	end

	def test_for_winner_at_036_X_with_empties
		board = Board.new(3)
		marker = 'X'
		board.ttt_board = ['X', 'O', 'O', 'X', ' ', 'O', 'X', ' ', ' ']
		assert_equal(true, board.winner?(marker))	
	end

	def test_for_no_winner_empties
		board = Board.new(3)
		marker = 'X'
		board.ttt_board = ['X', 'X', ' ', 'X', ' ', 'O', ' ', ' ', 'O']
		assert_equal(false, board.winner?(marker))	
	end

	def test_for_no_winner_full_board
		board = Board.new(3)
		marker = 'X'
		board.ttt_board = ['O', 'X', 'X', 'X', 'X', 'O', 'O', 'O', 'X']
		assert_equal(false, board.winner?(marker))	
	end


end