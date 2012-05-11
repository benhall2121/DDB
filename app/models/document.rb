class Document < ActiveRecord::Base
  belongs_to :user	
  belongs_to :company
  belongs_to :doctype
  
  attr_accessible :doc, :user_id, :description, :doctype_id
  
  has_attached_file :doc, :whiny => false, :styles => { :icon => ["48x63>", :jpg], :small => ["128x128>", :jpg], :medium => ["300x300>", :jpg], :large => ["1224x1584>", :jpg] }, #:styles      => {:icon => "50x50#", :thumb=> "100x100#", :small  => "190x190#", :large => "500x500>" },
  :url  => "/assets/docs/:id/:style/:basename.:extension",
  :path => ":rails_root/public/assets/docs/:id/:style/:basename.:extension",
  :convert_options => { :large => '-quality 100' }

  validates_attachment_size :doc, :less_than => 10.megabytes
  #validates_attachment_content_type :attached, :content_type => ['image/jpeg', 'image/png', 'application/pdf', 'application/octet-stream', 'application/msword']
end
