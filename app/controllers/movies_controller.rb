class MoviesController < ApplicationController
	
	def index
		@movies = Movie.all
	end

	def show
		@movie = Movie.find(params[:id])
	end

	# Find a movie based on user tastes, etc...
	def find
		render 'movies/find', layout: 'tunnel'
	end

	# The movie player
	def watch
	end
end
