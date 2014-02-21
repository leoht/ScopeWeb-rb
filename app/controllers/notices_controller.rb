class NoticesController < ApplicationController

  def index
  	id = params.permit(:movie_id).require(:movie_id)
  	@movie = Movie.find(id)
  	@notices = @movie.notices.all
  end

  def show
  end

  def share
  end
end
