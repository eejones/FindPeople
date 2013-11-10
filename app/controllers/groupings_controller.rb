class GroupingsController < ApplicationController
#  before_action :signed_in?

  def new
    Grouping.new
  end

  def create
    @group = Group.find_by_id(params[:grouping][:group_id])
    @member = current_member
    @grouping = @group.groupings.create(:member_id => @member.id)
    if @grouping.save
      respond_to do |format|
        format.html { redirect_to groups_url }
        format.js
      end
#      flash[:notice] = "You have joined this group."
#      redirect_to :back
    else
      flash[:error] = "Unable to join."
      redirect_to :back
    end
  end

  def destroy
    @member = Member.find_by_id(current_member)
    @grouping = Grouping.find(params[:id])
    @grouping.destroy
    respond_to do |format|
      format.html { redirect_to groups_url }
      format.js
    end
  end
end
