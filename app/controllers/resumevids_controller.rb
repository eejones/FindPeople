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
#    @resumevid.rvideo=@resumevid.originvid.replace(/(?:http:\/\/)?(?:www\.)?(?:youtube\.com|youtu\.be)\/(?:watch\?v=)?(.+)/, '<iframe width="420" height="345" src="http://www.youtube.com/embed/$1" frameborder="0" allowfullscreen></iframe>')
#    @resumevid.rvideo=@resumevid.originvid.replace(/(?:http:\/\/)?(?:www\.)?(?:youtube\.com|youtu\.be)\/(?:watch\?v=)?(.+)/, 'http://www.youtube.com/embed/$1')
#   redirect_to member_edit_path(@member)
  end

  def destroy
    @member = Member.find(params[:member_id])
    @resumevid = @member.resumevids.find(params[:id])
    @resumevid.destroy
    redirect_to edit_member_path(@member)
  end
end
