class Board

	attr_accessor :ttt_board

	def initialize(board_size)
		@board_size = board_size
		@ttt_board = *(1..(board_size * board_size))
	end

	def update_position(position, marker)
		ttt_board[position] = marker
	end

	def valid_position?(position)

		if ttt_board[position] != 'X' && ttt_board[position] != 'O' && position.between?(0,8)
			true
		else
			false
		end
		
	end

	def valid_input?(input)
		
		if input.match(/[xXoO]/)
			true
		else
			false
		end
		
	end

	def full_board?
		if ttt_board.all? { |x| x.is_a?(String) }
			true
		else
			false
		end
	end

	def winner?(marker)

		#2D array of winning combos
		#creates an array of range 0 to the length of the board to use as index positions
		pos_array  = *(0..(ttt_board.length - 1))
		#slices the array into rows based on the inputted board size
		rows = pos_array.each_slice(@board_size).to_a
		#this will be the actual array of winning combos
		winning_combos = []

		rows.each do |element|
			winning_combos << element
		end

		count = 0
		combo = []
		#iterates over the rows and selects the first element in each, pushing it into a combo array, then pushing into winning array
		#this gives us winning columns. The count increases each loop to create the next column
		#it loops a number of times equal to board size so we get the correct number of columns
		@board_size.times do

				rows.each do |element|
					combo << element[count]
				end
				

			count += 1
			winning_combos << combo
			combo = []
		end

		#same principal as above but increments each element instead of each loop
		#this selects corner to corner
		count = 0
		diag_combo_one = []
		rows.each do |element|
			diag_combo_one << element[count]
			count += 1
		end
		winning_combos << diag_combo_one

		#same as last, but increments negatively to get the opposite corners
		count = -1
		diag_combo_two = []
		rows.each do |element|
			diag_combo_two << element[count]
			count -= 1
		end
		winning_combos << diag_combo_two


		#Set results to false by default.
		results = false

		#Nested loops.  Iterates over 'outer' array
		#Then iterates over each inner_array.
		#Uses the value from each number in the inner array as
		#an index position in ttt_board.
		#If there is a match, it adds to count. If count reaches
		#three, results get set to true because all 3 in a set matched.
		#Count is reset to 0 for every new inner array item
		#because it is outside the inner loop.
		winning_combos.each do |inner_array|
			count = 0

			inner_array.each do |value|

				if ttt_board[value] == marker

					count += 1

					if count == @board_size

						results = true

					end
				end
			end
		end
		#Calls our results which is false by default.
		#Only true if a set of the three combos matches.
		results

	end


end