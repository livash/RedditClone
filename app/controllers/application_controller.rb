class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def current_user
    if session[:session_token]
     return User.find_by_session_token(session[:session_token])
    end
    
    nil
  end
  
  def verify_user
    if current_user.session_token == session[:session_token]
    else
      redirect_to new_session_url
    end
  end
end
