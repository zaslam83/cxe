module SessionsHelper
  
  def sign_in(user)
    self.current_user = user
	session[:remember_token] = user.id
  end

  def signed_in?
    !current_user.nil?
  end

  def sign_out
    self.current_user = nil
	session[:remember_token] = nil
  end
  
  def current_user=(user)
    @current_user = user
  end
  
  def current_user
     @current_user ||= User.find(session[:remember_token]) unless session[:remember_token].nil?
  end
  
end
