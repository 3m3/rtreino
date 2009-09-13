class CreateAnalyses < ActiveRecord::Migration
  def self.up
    create_table :analyses do |t|
      t.text :body
      t.integer :user_id
      t.integer :problem_id
      
      t.timestamps
    end
  end
  
  def self.down
    drop_table :analyses
  end
end