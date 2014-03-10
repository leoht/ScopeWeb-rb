class MoviesController < ApplicationController
	
	def index
		@movies = Movie.all
	end

	def show
		@movie = Movie.find(params[:id])
	end

	# Find a movie based on user tastes, etc...
	def find
		if session[:quiz_step].nil?
			session[:quiz_step] = 1
		else
			session[:quiz_step] += 1
		end

		case session[:quiz_step]
		when 1 then
			render 'movies/find_by_mood', layout: 'tunnel'
		when 2 then
			session[:quiz_mood] = params[:mood]
			render 'movies/find_by_related_movies', layout: 'tunnel'
		# when 3 then

		else render 'movies/find_by_mood', layout: 'tunnel'
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
