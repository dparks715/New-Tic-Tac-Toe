class Human

	attr_accessor :marker

	def initialize(marker)
		@marker = marker
	end

	def get_move(board_state)
		puts 'Enter 1-9 to choose your square: '
		puts " 1 | 2 | 3 "
		puts "-----------"
		puts " 4 | 5 | 6 "
		puts "-----------"
		puts " 7 | 8 | 9 "

		move = gets.chomp.to_i - 1
	end
		
end