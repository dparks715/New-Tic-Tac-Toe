class Random

	attr_accessor :marker

	def initialize(marker)
		@marker = marker
	end


	# Checks if value is and empty string
	# If true, pushes the index position into valid_pos
	# Samples valid_pos to return random valid index position
	def get_move(board_state)
		valid_pos = []

		board_state.each_with_index do |val, pos|
			if val == ' '
				valid_pos.push(pos)
			end
		end
		valid_pos.sample
	end

end