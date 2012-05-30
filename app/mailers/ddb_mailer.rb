class DdbMailer < ActionMailer::Base
  include ApplicationHelper
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

  def doc_phone_email(sent_email, email_to)
    @doc = sent_email
    @full_url_path = "http://ddb.benerino.com/"

    @showUsername = username(@doc.user)
    @userCompany = user_company_not_logged_in(@doc.user_id)
    
    if !@doc.doc_file_name.nil?
      filePath = @doc.doc.url(:original)[/[^?]+/]
      attachments[@doc.doc_file_name] = File.read("#{Rails.root}/public#{filePath}")
    end

    mail(:to => email_to, :subject => @showUsername + " " + @doc.doctype.name + " Document.")
  end

  def password_reset(user)
    @user = user
    mail :to => user.email, :subject => "Password Reset"
  end
end
