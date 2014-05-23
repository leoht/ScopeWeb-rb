class SessionsController < ApplicationController
  def create
  	@user = User.from_omniauth(env["omniauth.auth"])
  	session[:user_id] = @user.id
  	redirect_to watch_movie_path(Movie.take)
  
  end

  def destroy
  	session[:user_id] = nil

  	if request.params.has_key? 'target'
  		redirect_to request.params['target']
  	else
  		redirect_to root_path
  	end
  end
end
