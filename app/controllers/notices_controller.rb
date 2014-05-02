class NoticesController < ApplicationController

  before_filter :allow_cors

  def index
  	id = params.permit(:movie_id).require(:movie_id)
  	@movie = Movie.find(id)
  	@notices = @movie.notices.all

  	response.headers['Access-Control-Allow-Origin'] = '*'

  	respond_to do |format|
  		format.json {
  			render json: @notices.to_json
  		}
  		format.html {
  			render 'notices/index'
  		}
  	end
  end

  def show
  end

  def share
  end

  # randomly picks notices for notice chooser API
  def random
    notices = Notice.where('id IN (40, 3, 28, 37, 42)')

    respond_to do |format|
      format.json { render json: notices.to_json }
    end
  end

  def search
    @query = params[:s]
    s = '%'+ @query + '%'
    @notices = Notice.find(:all, :conditions => ['title LIKE ? OR short_content LIKE ?', s, s])

    respond_to do |format|
      format.json { render json: @notices.to_json }
    end
  end

  # Allow cross origin requests for ajax api.
  def allow_cors
    headers["Access-Control-Allow-Origin"] = "*"
    headers["Access-Control-Allow-Methods"] = "*"
    headers["Access-Control-Allow-Headers"] = %w{Origin Accept Content-Type X-Requested-With X-CSRF-Token}.join(",")
    head(:ok) if request.request_method == "OPTIONS"
    # or, render text: ''
    # if that's more your style
  end
end
