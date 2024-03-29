class UsersController < ApplicationController
  before_filter :require_company, :except => [:show]
  before_filter :require_current_user, :only => [:show]
	
  def index
    @users = current_company.users.find(:all, :order => 'name')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(current_user.id)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = current_company.users.find(params[:id])
  end

  # POST /users
  # POST /users.xml
  def create
    @user = current_company.users.new(params[:user])

    respond_to do |format|
      if @user.save
      	      
      	#Email
      	if !@user.email.nil?
          c_url = request.protocol + request.env["HTTP_HOST"]
          DdbMailer.new_user_sign_up(@user, params[:user][:password], c_url).deliver
	end      
      	      
      	format.html { redirect_to(users_path, :notice => 'User was successfully created.') }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = current_company.users.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(users_path, :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = current_company.users.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
end
