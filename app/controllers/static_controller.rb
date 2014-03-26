class StaticController < ApplicationController
	
  def home
  	if current_user
	  	@user = current_user
		@user_data = FbGraph::User.new('me', :access_token => current_user.oauth_token)
		@user_data.fetch
	end

	render 'static/home', layout: 'home'
  end

  def about

  end
end
