class AddUserstampStatements < ActiveRecord::Migration
  def self.up
    add_column :statements, :creator_id, :integer
    add_column :statements, :updater_id, :integer
    say_with_time "Put first user from db as creator of statements" do
      user_id = User.first.id
      Statement.all.each do |statement|
        statement.creator_id = statement.updater_id = user_id
        statement.save
      end
    end
  end

  def self.down
    remove_column :statements, :creator_id
    remove_column :statements, :updater_id
  end
end
