class CreateAbouts < ActiveRecord::Migration
  def self.up
    create_table :abouts do |t|
      t.string :about_url
      t.integer :company_id
      t.string :title
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :abouts
  end
end
