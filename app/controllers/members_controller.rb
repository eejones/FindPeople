class MembersController < ApplicationController
  # GET /members
  # GET /members.json

  before_filter :signed_in_member, :only=> [:index, :edit, :update]
  before_filter :admin_member, :only=> :destroy

  def index
    @filters = Member::FILTERS
#    if params[:show] && @filters.collect{|f| f[:scope]}.include?(params[:show])
#      @members = Member.send(params[:show]).paginate(:page=> params[:page])
#    else
#      @members = Member.paginate(:page=> params[:page])
#      respond_to do |format|
#        format.html # index.html.erb
#        format.json { render json: @members }
#      end
#    end  
#      if (params[:filters] && @filters.collect{|f| f[:scope]}.include?(params[:filters]))
#      if (params[:filters] && ((params[:filters])-(@filters.collect{|f| f[:scope]}))==0)
      if :filters
#       if @filters.collect{|f| f[:scope]}.include?(:filters)
#        @members = Member.send(params[:filters]).paginate(:page=> params[:page])
       @members = Member.send(params[:filters]).paginate(:page=> params[:page])
      else
        @members = Member.paginate(:page=> params[:page])
        respond_to do |format|
          format.html # index.html.erb
          format.js
      end
    end  
  end

  # GET /members/1
  # GET /members/1.json
  def show
    @member = Member.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @member }
    end
  end

  # GET /members/new
  # GET /members/new.json
  def new
    @member = Member.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @member }
    end
  end

  # GET /members/1/edit
  def edit
    @member = Member.find(params[:id])
  end

  # POST /members
  # POST /members.json
  def create
    @member = Member.new(params[:member])
    respond_to do |format|
      if @member.save
        sign_in @member
        flash[:success] = "Welcome!"
        format.html { redirect_to @member, :notice=> 'Member was successfully created.' }
        format.json { render :json=> @member, :status=> :created, :location=> @member }
      else
        format.html { render :action=> "new" }
        format.json { render :json=> @member.errors, :status=> :unprocessable_entity }
      end
    end
  end

  # PUT /members/1
  # PUT /members/1.json
  def update
    @member = Member.find(params[:id])
    respond_to do |format|
      if @member.update_attributes(params[:member])
        sign_in @member
        format.html { redirect_to @member, :notice=> 'Member was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action=> "edit" }
        format.json { render :json=> @member.errors, :status=> :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    respond_to do |format|
      format.html { redirect_to members_url }
      format.json { head :no_content }
    end
  end

private

    def signed_in_member
      unless signed_in?
        store_location
        redirect_to signin_url, :notice=> "Please sign in."
      end
    end

    def correct_member
      @member = Member.find(params[:id])
      redirect_to(root_path) unless current_member?(@member)
    end

    def admin_member
      redirect_to(root_path) unless current_member.admin?
    end
end
