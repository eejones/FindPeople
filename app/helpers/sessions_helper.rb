module SessionsHelper

  def sign_in(member)
    cookies.permanent[:remember_token] = member.remember_token
    self.current_member = member
  end

  def signed_in?
    !current_member.nil?
  end

  def current_member=(member)
    @current_member=member
  end

  def current_member
    @current_member ||= Member.find_by_remember_token(cookies[:remember_token])
  end

  def sign_out
    self.current_member = nil
    cookies.delete(:remember_token)
  end

  def current_member?(member)
    member == current_member
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.url
  end
end
