class UsersController < ApplicationController

  def index
    @users_without_current = User.without_user(current_user)
    @users = User.all
    @count = User.count
  end

  def status
    @user = User.find(params[:id])
    respond_to do |format|
      format.js  
      format.html { redirect_to root_path }
      format.json { render :json =>  @user.to_json(:only => [:id, :status], :methods => [:full_name]) }
    end
  end
  
  def show
    @user = User.find(params[:id])    
  end

  def edit
    @user = User.find(params[:id])    
  end

  def update
    user = User.find(params[:id])
    user.update_attributes(params[:user])
    redirect_to users_path
  end


end
