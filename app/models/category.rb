class Category < ActiveRecord::Base
  has_and_belongs_to_many :problems
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

    if category_id != nil
      category = Category.find(category_id)
      while (category != nil)
        if category.id == id
          errors.add(:category_id, 'should not be cyclic')
          break
        end
        category = category.category
      end
    end
  end

end
