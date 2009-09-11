class CreateProblemsCategories < ActiveRecord::Migration
  def self.up
    create_table :problems_categories, :id => false do |t|
      t.integer :problem_id, :null => false
      t.integer :category_id, :null => false
    end
  end

  def self.down
    drop_table :problems_categories
  end
end
