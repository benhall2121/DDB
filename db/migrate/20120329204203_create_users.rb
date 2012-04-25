class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.integer :company_id
      t.string :username
      t.string :email
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
