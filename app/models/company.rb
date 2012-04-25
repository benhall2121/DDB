class Company < ActiveRecord::Base
  has_many :users
  has_many :doctypes
  has_many :documents
  attr_accessible :logo, :username, :password, :password_confirmation, :address, :city, :zip, :company_name, :url, :phone, :email, :state
  
  attr_accessor :password
  before_save :encrypt_password
  
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :username
  validates_uniqueness_of :username
  
  has_attached_file :logo, :styles => { :small => "150x150>" },
    :url  => "/assets/company_logos/:id/:style/:basename.:extension",
    :path => ":rails_root/public/assets/company_logos/:id/:style/:basename.:extension"

  validates_attachment_size :logo, :less_than => 5.megabytes
  #validates_attachment_content_type :logo, :content_type => ['image/jpeg', 'image/png']
  
  def self.authenticate(username, password)
    company = find_by_username(username)
    if company && company.password_hash == BCrypt::Engine.hash_secret(password, company.password_salt)
      company
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
  
end
