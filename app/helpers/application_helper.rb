module ApplicationHelper

  # The company that the current user goes to or the company page that was landed on.
  def users_company
    if session[:user_company_id]
      @user_company = Company.find(session[:user_company_id])
    else
      return false
    end
  end

end
