class AddColumnDifficultValue < ActiveRecord::Migration
  def self.up
    add_column :levels, :difficult_value, :integer
  end

  def self.down
    remove_column :levels, :difficult_value
  end
end
