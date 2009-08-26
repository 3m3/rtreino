class CreateLevelsData < ActiveRecord::Migration
  def self.up
    Level.delete_all
    Level.create(
      :description => "My grandma can solve it",
      :difficult_value => 0
    )
    Level.create(
      :description => "Easy",
      :difficult_value => 1
    )
    Level.create(
      :description => "Medium",
      :difficult_value => 2
    )
    Level.create (
      :description => "Hard",
      :difficult_value => 3
    )
    Level.create (
      :description => "Yoshi is thinking about this problem. Probably it is impossible.",
      :difficult_value => 4
    )



  end

  def self.down
  end
end
