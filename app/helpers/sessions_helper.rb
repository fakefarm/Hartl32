module SessionsHelper
	def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token
    current_user = user
		    flash[:success] = "A smooth sea never made a skilled mariner."
  end

  def signed_in?
    !current_user.nil?
  end

	def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= user_from_remember_token
  end

  private

  def user_from_remember_token
    remember_token = cookies[:remember_token]
    User.find_by_remember_token(remember_token) unless remember_token.nil?
  end

  def sign_out
    current_user = nil
    cookies.delete(:remember_token)
    flash[:success] = "The hard road becomes the easy road. And the easy road becomes the hard road..."
  end
end
