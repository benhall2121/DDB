class DoctypesController < ApplicationController
  before_filter :require_company	
		
  # GET /doctypes
  # GET /doctypes.xml
  def index
    @doctypes = current_company.doctypes.find(:all, :order => 'name')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @doctypes }
    end
  end

  # GET /doctypes/1
  # GET /doctypes/1.xml
  def show
    @doctype = Doctype.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @doctype }
    end
  end

  # GET /doctypes/new
  # GET /doctypes/new.xml
  def new
    @doctype = Doctype.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @doctype }
    end
  end

  # GET /doctypes/1/edit
  def edit
    @doctype = Doctype.find(params[:id])
  end

  # POST /doctypes
  # POST /doctypes.xml
  def create
    @doctype = current_company.doctypes.new(params[:doctype])

    respond_to do |format|
      if @doctype.save
      	      format.html { redirect_to(doctypes_path, :notice => 'Doctype was successfully created.') }
        format.xml  { render :xml => doctypes_path, :status => :created, :location => @doctype }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @doctype.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /doctypes/1
  # PUT /doctypes/1.xml
  def update
    @doctype = Doctype.find(params[:id])

    respond_to do |format|
      if @doctype.update_attributes(params[:doctype])
        format.html { redirect_to(doctypes_path, :notice => 'Doctype was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @doctype.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /doctypes/1
  # DELETE /doctypes/1.xml
  def destroy
    @doctype = Doctype.find(params[:id])
    @doctype.destroy

    respond_to do |format|
      format.html { redirect_to(doctypes_url) }
      format.xml  { head :ok }
    end
  end
end
