class Problem < ActiveRecord::Base
  validates_presence_of :code, :name, :source
  belongs_to :level  
  has_many :statements
end
