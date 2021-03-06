class ApplicationController < ActionController::Base
  protect_from_forgery

  include SessionsHelper
  include MembersHelper


  def this_member
    @this_member ||= Member.find_by_remember_token(cookies[:remember_token])
  end

#    @this_member ||= Member.find_by_remember_token(cookies[:remember_token])

  def this_member?(member)
    member == this_member
  end

  def is_signed_in?
    !this_member.nil?
  end

  helper_method :is_signed_in?
  helper_method :this_member

  # Force signout to prevent CSRF attacks
  def handle_unverified_request
    sign_out
    super
  end

end
