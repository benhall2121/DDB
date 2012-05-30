class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_company_if_current_user
  
  helper_method :current_company, :current_user

  private

  def set_company_if_current_user
    session[:user_company_id] = current_user.company_id if current_user
  end

  def set_company(user)
    session[:user_company_id] = user.company_id
  end

  def require_company
    unless current_company
      redirect_to root_path
    end
  end
  
  def require_current_user
    unless current_user
      if !session[:user_company_id].nil?
        redirect_to company_path(session[:user_company_id])
      else
        redirect_to root_url
      end
    end
  end

  def require_user
    if !current_user
      if !users_company.nil?
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
    @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
  end
end
