class Level < ActiveRecord::Base
  has_many :problems
  validates_presence_of :name
  validates_uniqueness_of :name
end
