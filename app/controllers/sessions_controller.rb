class SessionsController < ApplicationController
  
  def new
  end

  def create
    @user = User.find_by_username(params[:user][:username])
    if @user# and @user.check_password?(params[:password])
      
      @user.issue_new_session_token!
      session[:session_token] = @user.session_token
      redirect_to user_url(@user)
    else
      render :new
    end
  end
  
  def destroy
    @user = current_user
    @user.session_token = nil
    @user.save!
    session[:session_token] = nil
    render :new
  end
end
