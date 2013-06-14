class UsersController < ApplicationController

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      @user.issue_new_session_token!
      session[:session_token] = @user.session_token
      render :show
    else
      render :new
    end
  end
  
  def show
    @user = current_user
  end

end
