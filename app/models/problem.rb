class Problem < ActiveRecord::Base
  has_and_belongs_to_many :categories, :join_table => 'problems_categories'
  belongs_to :level
end
