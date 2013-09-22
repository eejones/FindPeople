class GroupingsController < ApplicationController
  before_action :signed_in_member

  def new
    Grouping.new
  end

  def create
    @grouping=Grouping.new
    @group = Group.find(params[:grouping][:group_id])
    @member= Member.find(params[:grouping][:member_id])
    @group.join!(@member)
    redirect_to @current_member
  end

  def destroy
    @group = Grouping.find(params[:id]).member_id
    @current_member.unjoin!(@group)
    redirect_to @current_member
  end
end
