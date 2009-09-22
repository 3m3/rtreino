class Category < ActiveRecord::Base
  belongs_to :category
  validates_presence_of :name
  validates_uniqueness_of :name
  validate_on_update :validates_parents
  
  def long_name
    if self.category_id.nil? or self.id == self.category_id
      self.name
    else
      Category.find(self.category_id).long_name + ' > ' + self.name
    end
  end

  def validates_parents
    errors.add(:category_id, 'should not be the same') if category_id == id
  end

end
