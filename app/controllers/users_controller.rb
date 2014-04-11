class UsersController < ApplicationController

  before_filter :set_user, only: [:show, :movies, :friends]

  def register
  	@user = current_user

  end

  def show
  	
  end

  def movies
    @movies = @user.movies
  end

  def friends
    @friends = @user.friends
  end

  def me
  	if not current_user
  	  redirect_to root_path
  	else
  	  @user = User.find_by_uid(current_user.uid)
  	  redirect_to user_path(@user)
  	end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end
end
