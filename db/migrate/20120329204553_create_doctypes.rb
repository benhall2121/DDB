class CreateDoctypes < ActiveRecord::Migration
  def self.up
    create_table :doctypes do |t|
      t.integer :company_id
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :doctypes
  end
end
