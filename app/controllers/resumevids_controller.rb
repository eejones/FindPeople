class ResumevidsController < ApplicationController
  def create
    @member=Member.find(params[:member_id])
    @resumevid=@member.resumevids.create(params[:resumevid])
    respond_to do |format|
      if @resumevid.save
        format.html { redirect_to member_path(@member), :notice => 'Video was successfully added.' }
        format.json { render :json => @resumevid, :status => :created, :location => @resumevid }
      else
        format.html { redirect_to member_path(@member), :notice => 'Unprocessable video entry' }
        format.json { render :json => @resumevid.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @member = Member.find(params[:member_id])
    @resumevid = @member.resumevids.find(params[:id])
    @resumevid.destroy
    respond_to do |format|
      format.html { redirect_to member_path(@member) }
      format.js
    end
  end
end
