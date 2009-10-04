class AddTitleInStatements < ActiveRecord::Migration
  def self.up
    add_column :statements, :title, :string
    Statement.all do |statement|
      statement.title = statement.problem.title
    end
  end

  def self.down
    remove_column :statements, :title
  end
end
