class Sequential

	attr_accessor :marker
	
	# Initialize method gets the marker AI will use
	def initialize(marker)
		@marker = marker	
	end

	# Function takes in the current state of the board
	#Uses index method to find the first element that is an empty string
	#Returns the index position we can use later to update the board.
	def get_move(board_state)
		board_state.index(' ')
	end

end