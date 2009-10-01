class AddOnlineJudgeFieldsInProblem < ActiveRecord::Migration
  def self.up
    add_column :problems, :online_judge_id, :integer
    add_column :problems, :online_judge_code, :string
    add_column :problems, :online_judge_link, :string
  end

  def self.down
    remove_column :problems, :online_judge_id
    remove_column :problems, :online_judge_code
    remove_column :problems, :online_judge_link
  end
end
