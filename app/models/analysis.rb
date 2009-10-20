class Analysis < ActiveRecord::Base
  belongs_to :problem
  has_many   :comments, :as => :commentable 

  validates_presence_of :body, :problem

  acts_as_userstampable
  acts_as_model_loggable
  convert_txt_to_tags :body
end
