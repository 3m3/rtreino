class Analysis < ActiveRecord::Base
  validates_presence_of :body
  belongs_to :problem
  belongs_to :user
  has_many :comments, :as => :commentable
end
