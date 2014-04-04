class NoticeCategoriesController < ApplicationController
  def index
  	id = params.permit(:movie_id).require(:movie_id)
  	@categories = NoticeCategory.find_by_movie(id).notices
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
end
