require 'minitest/autorun'
require 'rack/test'
require_relative '../app.rb'

class TestApp < Minitest::Test
	include Rack::Test::Methods

	def app
		TicTacToe
	end

	def test_welcome
		get '/'
		assert(last_response.ok?)
		assert(last_response.body.include?('Welcome to Tic Tac Toe'))
		assert(last_response.body.include?("<option value='Human'>Human</option>"))
		assert(last_response.body.include?("<option value='Impossible!'>Impossible!</option>"))
	end

	def test_post_get_opponent
	  	post '/get_opponent', opponent: 'Hi'
	  	assert(last_response.ok?)
	  	assert(last_response.body.include?('Hi'))
  	
  end


end