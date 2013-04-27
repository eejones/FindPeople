class ResumevidsController < ApplicationController
  def create
    @member=Member.find(params[:member_id])
    @resumevid=@member.resumevids.create(params[:resumevid])
    redirect_to member_path(@member)
  end

  def destroy
    @member = Member.find(params[:member_id])
    @resumevid = @member.resumevid.find(params[:id])
    @resumevid.destroy
    redirect_to member_path(@member)
  end
end
