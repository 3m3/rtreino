class Category < ActiveRecord::Base
  has_and_belongs_to_many :problems, :join_table => 'problems_categories'
end
