class Analysis < ActiveRecord::Base
  belongs_to :problem
  has_many :comments, :as => :commentable
end
