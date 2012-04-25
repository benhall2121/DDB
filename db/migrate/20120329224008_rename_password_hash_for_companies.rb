class RenamePasswordHashForCompanies < ActiveRecord::Migration
  def self.up
    rename_column :companies, :password_has, :password_hash
  end

  def self.down
    rename_column :companies, :password_hash, :password_has
  end
end
