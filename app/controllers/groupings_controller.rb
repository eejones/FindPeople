class GroupingsController < ApplicationController
#  before_action :signed_in?

  def new
    Grouping.new
  end

  def create
    @group = Group.find_by_id(params[:grouping][:group_id])
    @member = current_member
#    @grouping = @member.groupings.create(:group_id => "13")
    @grouping = @group.groupings.create(:member_id => @member.id)
    if @grouping.save
      flash[:notice] = "You have joined this group."
      redirect_to :back
    else
      flash[:error] = "Unable to join."
      redirect_to :back
    end
#    @grouping=Grouping.new
#    @group = Group.find(params[:grouping][:group_id])
#    @member= Member.find(params[:grouping][:member_id])
#    @group.join!(@member)
#    redirect_to @current_member
  end

  def destroy
    @group = Grouping.find(params[:id]).member_id
    @current_member.unjoin!(@group)
    redirect_to @current_member
  end
end
