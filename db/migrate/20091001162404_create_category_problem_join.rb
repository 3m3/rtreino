class CreateCategoryProblemJoin < ActiveRecord::Migration
  def self.up
    create_table 'categories_problems', :id => false do |t|
      t.column 'category_id', :integer
      t.column 'problem_id', :integer
    end
  end

  def self.down
    drop_table 'categories_problems'
  end
end
