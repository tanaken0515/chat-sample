module SessionsHelper
  def login(user)
    logout
    cookies.encrypted[:user_id] = user.id
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||=  User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def logout
    cookies.encrypted[:user_id] = nil
    reset_session
  end
end
