class Analysis < ActiveRecord::Base
  validates_presence_of :body, :problem, :user
  belongs_to :problem
  belongs_to :user
  has_many :comments, :as => :commentable
  log_model_actions
  convert_txt_to_tags :body
end
