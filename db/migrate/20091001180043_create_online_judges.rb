class CreateOnlineJudges < ActiveRecord::Migration
  def self.up
    create_table :online_judges do |t|
      t.string :name
      t.string :webpage
      
      t.timestamps
    end
  end
  
  def self.down
    drop_table :online_judges
  end
end