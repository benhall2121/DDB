class RenameCompanyEmailColumn < ActiveRecord::Migration
  def self.up
    rename_column :companies, :emal, :email
  end

  def self.down
    rename_column :companies, :email, :emal
  end
end
