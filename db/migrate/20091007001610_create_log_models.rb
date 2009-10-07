class CreateLogModels < ActiveRecord::Migration
  def self.up
    create_table :log_models do |t|
      t.integer :loggable_id
      t.string :loggable_type
      t.string :action

      t.timestamps
    end
  end

  def self.down
    drop_table :log_models
  end
end
