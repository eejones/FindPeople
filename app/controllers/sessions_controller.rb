class SessionsController < ApplicationController

  def new
  end

  def create
    member=Member.find_by_username(params([:session_id][:username].downcase)
    if member && member.authenticate(params[:session][:password])
      sign_in member
      redirect_back_or member
    else
      flash[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end

