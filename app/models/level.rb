class Level < ActiveRecord::Base
  validate :should_be_in_range
  validates_presence_of :description

  def should_be_in_range 
    if self.difficult_value < 0 || self.difficult_value > 10
      errors.add_to_base "Value must be greater or equal than zero or lesser or equal than 10"
    end
  end
end
