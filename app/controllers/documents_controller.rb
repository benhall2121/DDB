class DocumentsController < ApplicationController
  before_filter :require_company, :except => [:index_current_user_docs]	
  before_filter :require_user, :only => [:index_current_user_docs]
  skip_before_filter :require_company, :only => [:doc_phone]
	

  def doc_phone
    @user = User.authenticate(params[:username], params[:password]);
    
    if @user
      @docs = @user.documents.find(:all, :conditions => ['user_id = ?',params[:user_id]], :order => 'updated_at desc')
      respond_to do |format|
        format.iphone {
          
          #User Info
          name = 'We are great'
          
          
        render :text => "#{name}" 


        }   
        format.html {redirect_to root_url, :notice => "Logged in!"} 
        format.xml {redirect_to root_url, :notice => "Logged in!" }   
      end
    else
      flash[:notice] = "Invalid username or password"
      
      respond_to do |format|
        format.iphone {render :text => "No" }   
        format.html {render "new"} 
        format.xml {render "new"}   
      end
    end



  end

  # GET /documents
  # GET /documents.xml
  def index
    @documents = current_company.documents.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @documents }
    end
  end
  
  def index_current_user_docs
    @documents = current_user.documents.all

    respond_to do |format|
      format.html { render 'index.html.erb' }
      format.xml  { render :xml => @documents }
    end
  end

  # GET /documents/1
  # GET /documents/1.xml
  def show
    @document = Document.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @document }
    end
  end

  # GET /documents/new
  # GET /documents/new.xml
  def new
    @document = current_company.documents.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @document }
    end
  end

  # GET /documents/1/edit
  def edit
    @document = current_company.documents.find(params[:id])
  end

  # POST /documents
  # POST /documents.xml
  def create
    @document = current_company.documents.new(params[:document])

    respond_to do |format|
      if @document.save
      	format.html { redirect_to(documents_path(), :notice => 'Document was successfully created.') }
        format.xml  { render :xml => @document, :status => :created, :location => @document }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @document.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /documents/1
  # PUT /documents/1.xml
  def update
    @document = current_company.documents.find(params[:id])

    respond_to do |format|
      if @document.update_attributes(params[:document])
        format.html { redirect_to(documents_path(), :notice => 'Document was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @document.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /documents/1
  # DELETE /documents/1.xml
  def destroy
    @document = current_company.documents.find(params[:id])
    @document.destroy

    respond_to do |format|
      format.html { redirect_to(documents_url) }
      format.xml  { head :ok }
    end
  end
end
