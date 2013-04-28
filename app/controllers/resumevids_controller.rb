class ResumevidsController < ApplicationController
  def create
    @member=Member.find(params[:member_id])
    @resumevid=@member.resumevids.create(params[:resumevid])
#    @resumevid.rvideo=@resumevid.originvid.replace(/(?:http:\/\/)?(?:www\.)?(?:youtube\.com|youtu\.be)\/(?:watch\?v=)?(.+)/, '<iframe width="420" height="345" src="http://www.youtube.com/embed/$1" frameborder="0" allowfullscreen></iframe>')
#    @resumevid.rvideo=@resumevid.originvid.replace(/(?:http:\/\/)?(?:www\.)?(?:youtube\.com|youtu\.be)\/(?:watch\?v=)?(.+)/, 'http://www.youtube.com/embed/$1')
    redirect_to member_path(@member)
#    redirect_to member_edit_path(@member)
  end

  def destroy
    @member = Member.find(params[:member_id])
    @resumevid = @member.resumevids.find(params[:id])
    @resumevid.destroy
    redirect_to member_path(@member)
  end
end
