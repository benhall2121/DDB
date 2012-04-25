class CompaniesController < ApplicationController
  before_filter :require_company, :except => [:home, :show, :new, :create]
  
  def home
    redirect_to company_home if company_home
    session[:user_company_id] = nil
  end
  
  def index
    @companies = Company.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @companies }
    end
  end

  # GET /companies/1
  # GET /companies/1.xml
  def show
    if params[:company_usersname]
     @company = Company.find_by_username(params[:company_usersname])	  	  
    else
      @company = Company.find(params[:id])
    end
    
    session[:user_company_id] = @company.id

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @company }
    end
  end

  # GET /companies/new
  # GET /companies/new.xml
  def new
    @company = Company.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @company }
    end
  end

  # GET /companies/1/edit
  def edit
    @company = Company.find(current_company.id)
  end

  # POST /companies
  # POST /companies.xml
  def create
    @company = Company.new(params[:company])
    
    respond_to do |format|
      if @company.save
        session[:company_id] = @company.id
      	#Email
      	if !@company.email.nil?
          c_url = request.protocol + request.env["HTTP_HOST"]
          DdbMailer.sign_up_email(@company, c_url).deliver
	end
      	format.html { redirect_to(@company, :notice => 'Company was Signed up!.') }
        format.xml  { render :xml => @company, :status => :created, :location => @company }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @company.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /companies/1
  # PUT /companies/1.xml
  def update
    @company = Company.find(current_company.id)

    respond_to do |format|
      if @company.update_attributes(params[:company])
        format.html { redirect_to(@company, :notice => 'Company was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @company.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.xml
  def destroy
    @company = Company.find(current_company.id)
    @company.destroy

    respond_to do |format|
      format.html { redirect_to(companies_url) }
      format.xml  { head :ok }
    end
  end
end
