class NoticeCategoriesController < ApplicationController

  before_filter :allow_cors
  
  def index
  	id = params.permit(:movie_id).require(:movie_id)
  	@categories = NoticeCategory.all

    respond_to do |format|
      format.json { render json: @categories.to_json }
    end
  end

  def show
  	id = params.permit(:id).require(:id)
  	@category = NoticeCategory.find(id)

  	# this is not a top level category
  	if @category.parent
  		@notices = NoticeCategory.find(id).notices

	  	respond_to do |format|
	  		format.json {
	  			render json: @notices.to_json
	  		}
	  		format.html {
	  			render 'notice_categories/index'
	  		}
	  	end
	else
		@children = NoticeCategory.where(parent_id: id)

		respond_to do |format|
	  		format.json {
	  			render json: @children.to_json
	  		}
	  		format.html {
	  			render 'notice_categories/index'
	  		}
	  	end
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
