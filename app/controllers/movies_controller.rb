class MoviesController < ApplicationController
	
	def index
		@movies = Movie.all
	end

	# Find a movie based on user tastes, etc...
	def find
	end

	# The movie player
	def watch
	end
end
