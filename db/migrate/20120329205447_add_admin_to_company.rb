class AddAdminToCompany < ActiveRecord::Migration
  def self.up
    add_column :companies, :admin, :boolean
  end

  def self.down
    remove_column :companies, :admin
  end
end
