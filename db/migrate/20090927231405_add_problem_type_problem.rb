class AddTypeProblem < ActiveRecord::Migration
  def self.up
    add_column :problems, :problem_type, :string
  end

  def self.down
    remove_column :problems, :problem_type
  end
end
