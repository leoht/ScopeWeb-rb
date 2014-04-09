class UsersController < ApplicationController

  def register
  	@user = current_user

  end

  def show
  	@user = User.find(params[:id])
  end

  def me
  	if not current_user
  	  redirect_to root_path
  	else
  	  @user = User.find_by_uid(current_user.uid)
  	  redirect_to user_path(@user)
  	end
  end
end
