module SessionsHelper
  def current_user
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def log_in_user!(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
    @current_user = user
  end

  def log_out!
    if logged_in?
      current_user.reset_session_token!
      session[:session_token] = nil
      redirect_to new_session_url
    end
  end

  def authenticate
    redirect_to new_sessions_url unless logged_in?
  end

  def logged_in?
    !!current_user
  end
end