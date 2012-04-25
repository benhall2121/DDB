class AddUsernameToCompany < ActiveRecord::Migration
  def self.up
    add_column :companies, :username, :string
  end

  def self.down
    remove_column :companies, :username
  end
end
