module ApplicationHelper

  # The company that the current user goes to or the company page that was landed on.
  def users_company
    if session[:user_company_id]
      @user_company = Company.find(session[:user_company_id])
    else
      return false
    end
  end

  def user_company_not_logged_in(user_id)
    if !user_id.nil?
      @user_company = User.find(user_id).company
    elsif session[:user_id]
      @user_company = User.find(session[:user_id]).company
    else
      return "Belongs to No Company"
    end
  end

  def username(u)
    if u.is_a?(Integer)
      u = User.find_by_id(u)
    end
    
    if !u.name.nil? && !u.name.blank?
      name = u.name
    else
      name = u.username	
    end
    
    return name
  end

end
