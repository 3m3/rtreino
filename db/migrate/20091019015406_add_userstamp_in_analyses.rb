class AddUserstampInAnalyses < ActiveRecord::Migration
  def self.up
    add_column :analyses, :creator_id, :integer
    add_column :analyses, :updater_id, :integer
    say_with_time "Updating creator from analyses" do
      Analysis.all.each do |analysis|
        analysis.creator_id = analysis.user_id
        analysis.updater_id = analysis.user_id
        analysis.save
      end
    end
    remove_column :analyses, :user_id
  end

  def self.down
    add_column :analyses, :user_id, :integer
    say_with_time "Updating user_id from analyses" do
      Analysis.all.each do |analysis|
        analysis.user_id = analysis.creator_id
        analysis.save
      end
    end
    remove_column :analyses, :creator_id
    remove_column :analyses, :updater_id
  end
end
