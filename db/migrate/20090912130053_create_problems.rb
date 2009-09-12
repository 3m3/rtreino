class CreateProblems < ActiveRecord::Migration
  def self.up
    create_table :problems do |t|
      t.string :code
      t.string :name
      t.string :source
      t.integer :level_id
      
      t.timestamps
    end
  end
  
  def self.down
    drop_table :problems
  end
end