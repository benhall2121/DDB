class CreateDocuments < ActiveRecord::Migration
  def self.up
    create_table :documents do |t|
      t.integer :user_id
      t.integer :doctype_id
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :documents
  end
end
