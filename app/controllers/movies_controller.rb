class MoviesController < ApplicationController
	
	def index
		@movies = Movie.all
	end

	def show
		@movie = Movie.find(params[:id])
	end

	# Find a movie based on user tastes, etc...
	def find
		if not request.params['step']
			@step = 1
		else
			@step = request.params['step']
		end

		case @step
		when '1' then
			render 'movies/finder/mood', layout: 'tunnel'
		when '2' then
			render 'movies/finder/related_movies', layout: 'tunnel'
		when '3' then
			render 'movies/finder/related_facts', layout: 'tunnel'
		end
	end

	# The movie player
	def watch
		@movie = Movie.find(params[:id])
	end

	def more
		@movie = Movie.find(params[:id])
	end

	def search
		@query = params[:s]
		s = '%'+ @query + '%'
		@movies = Movie.find(:all, :conditions => ['title LIKE ? OR summary LIKE ? OR author LIKE ?', s, s, s])
	end
end
