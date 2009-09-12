class Category < ActiveRecord::Base
  belongs_to :category
  
  def long_name
    if self.category_id.nil? or self.id == self.category_id
      self.name
    else
      Category.find(self.category_id).long_name + " > " + self.name
    end
  end
end
