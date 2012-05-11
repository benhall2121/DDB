class SessionsController < ApplicationController

  def new
  end

  def create
    company = Company.authenticate(params[:username], params[:password])
    if company
      session[:company_id] = company.id
      session[:user_company_id] = company.id
      redirect_to root_url, :notice => "Company Logged in!"
    else
      flash.now.alert = "Invalid username or password"
      render "new"
    end
  end

  def destroy
    session[:company_id] = nil
    session[:user_company_id] = nil
    redirect_to root_url, :notice => "Company Logged out!"
  end
  
  def new_user
  end
  
  def create_user
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      session[:user_company_id] = user.company_id
      redirect_to user_path(current_user), :notice => "User Logged in!"
    else
      flash.now.alert = "Invalid username or password"
      render "new"
    end
  end

  def destroy_user
   
    #When a user logs out redirect them to the company site
    if session[:user_company_id].nil?
      red_route = current_user.company_id
    else
      red_route = session[:user_company_id]
    end
    
    session[:user_id] = nil
    
    redirect_to company_path(red_route), :notice => "User Logged out!"
  end

  def log_in_phone
    puts ''
    puts 'log_in_phone'
    user = User.authenticate(params[:username], params[:password])
    if user
      puts 'user'
      session[:user_id] = user.id
      session[:user_company_id] = user.company_id
      
      respond_to do |format|
        format.iphone {render :text => "#{user.id}" }   
        format.html {redirect_to root_url, :notice => "Logged in!"} 
        format.xml {redirect_to root_url, :notice => "Logged in!" }   
      end
    else
      puts 'no user'
      flash[:notice] = "Invalid username or password"
      
      respond_to do |format|
        format.iphone {render :text => "No" }   
        format.html {render "new"} 
        format.xml {render "new"}   
      end
    end
  end
  
end
