class MoviesController < ApplicationController

	before_action :set_movie, only: [:show, :watch, :more, :documentation, :community]
	
	def index
		@movies = Movie.all
	end

	def show
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
			@related_movies = RelatedMovie.all.limit 5
			@related_facts = MovieRelatedFact.all.limit 5
			@movie = Movie.take
			render 'movies/find', layout: 'tunnel'
		when '2' then
			@percent = 30
			@related_movies = RelatedMovie.all.limit 5
			render 'movies/finder/related_movies', layout: 'tunnel'
		when '3' then
			@percent = 70
			@related_facts = MovieRelatedFact.all.limit 5
			render 'movies/finder/related_facts', layout: 'tunnel'
		when '4' then
			redirect_to movie_path(Movie.take)
		end
	end

	# The movie player
	def watch
		# update viewed movies if user logged in
		if current_user
			@user = current_user
			if not @user.movies.exists? @movie
				@user.movies << @movie
			end
		end
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
