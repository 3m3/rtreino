class AddUserstampInComments < ActiveRecord::Migration
  def self.up
    add_column :comments, :creator_id, :integer
    add_column :comments, :updater_id, :integer
    say_with_time "Updating creator from comments" do
      Comment.all.each do |comment|
        comment.creator_id = comment.user_id
        comment.updater_id = comment.user_id
        comment.save
      end
    end
    remove_column :comments, :user_id
  end

  def self.down
    add_column :comments, :user_id
    say_with_time "Updating user_id from comments" do
      Comment.all.each do |comment|
        comment.user_id = comment.creator_id
        comment.save
      end
    end
    remove_column :comments, :creator_id
    remove_column :comments, :updater_id
  end
end
