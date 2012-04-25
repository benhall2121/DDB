class AddPasswordToCompanies < ActiveRecord::Migration
  def self.up
    add_column :companies, :password_has, :string
    add_column :companies, :password_salt, :string
  end

  def self.down
    remove_column :companies, :password_salt
    remove_column :companies, :password_has
  end
end
