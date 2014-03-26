class MoviesController < ApplicationController

	before_action :set_movie, only: [:show, :watch, :more, :documentation, :community]
	
	def index
		@movies = Movie.all
	end

	def show
		render 'movies/show', layout: 'full'
	end

	# Find a movie based on user tastes, etc...
	def find
		if not request.params['step']
			@step = '1'
		else
			@step = request.params['step']
		end

		case @step
		when '1' then
			@percent = 0
			render 'movies/finder/mood', layout: 'tunnel'
		when '2' then
			@percent = 30
			render 'movies/finder/related_movies', layout: 'tunnel'
		when '3' then
			@percent = 70
			render 'movies/finder/related_facts', layout: 'tunnel'
		end
	end

	# The movie player
	def watch
	end

	def more
	end

	def documentation
	end

	def community
	end

	def search
		@query = params[:s]
		s = '%'+ @query + '%'
		@movies = Movie.find(:all, :conditions => ['title LIKE ? OR summary LIKE ? OR author LIKE ?', s, s, s])
	end

	private
		def set_movie
			@movie = Movie.find(params[:id])
		end
end
