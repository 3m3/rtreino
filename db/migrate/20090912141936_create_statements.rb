class CreateStatements < ActiveRecord::Migration
  def self.up
    create_table :statements do |t|
      t.integer :language_id
      t.integer :problem_id
      t.text :body
      
      t.timestamps
    end
  end
  
  def self.down
    drop_table :statements
  end
end
