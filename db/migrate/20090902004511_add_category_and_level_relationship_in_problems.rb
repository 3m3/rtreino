class AddCategoryAndLevelRelationshipInProblems < ActiveRecord::Migration
  def self.up
    add_column :problems, :category_id, :integer
    add_column :problems, :level_id, :integer
  end

  def self.down
    remove_column :problems, :category_id
    remove_column :problems, :level_id
  end
end
