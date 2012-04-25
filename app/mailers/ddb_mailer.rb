class DdbMailer < ActionMailer::Base
  default :from => "Website@benerino.com"
  
  def sign_up_email(sent_email, url)
    @sent_email = sent_email
    @current_url = url
    mail(:to =>  sent_email.email, :subject => "You signed up for DDB")
  end
  
  def new_user_sign_up(sent_email, password, url)
    @sent_email = sent_email
    @password = password
    @company_name = sent_email.company.company_name
    @current_url = url
    mail(:to =>  sent_email.email, :subject => "You have been signed up for DDB by " + @company_name)
  end
end
