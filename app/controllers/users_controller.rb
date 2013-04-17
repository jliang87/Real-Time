class UsersController < ApplicationController

  def index
    @users = User.without_user(current_user)
  end
  
  def edit
  end

  def update
    current_user.update_attributes(params[:user])
    redirect_to users_path
  end


end
