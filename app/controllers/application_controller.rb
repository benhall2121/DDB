class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_company, :current_user

  private

  def require_company
    unless current_company
      redirect_to root_path
    end
  end
  
  def require_user
    if !current_user
      if users_company
        redirect_to company_path(@user_company.id)
      else
        redirect_to root_url
      end
    end
  end
  
  def company_home
    if current_company
      return company_path(current_company)  
    end
  end
  
  def current_company
    @current_company ||= Company.find(session[:company_id]) if session[:company_id]
  end
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
