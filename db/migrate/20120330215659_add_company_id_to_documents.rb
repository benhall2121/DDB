class AddCompanyIdToDocuments < ActiveRecord::Migration
  def self.up
    add_column :documents, :company_id, :integer
  end

  def self.down
    remove_column :documents, :company_id
  end
end
