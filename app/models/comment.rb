class Comment < ActiveRecord::Base
  belongs_to :commentable, :polymorphic => true
  has_many   :comments, :as => :commentable

  validates_presence_of :commentable_id

  acts_as_userstampable
  acts_as_model_loggable
  convert_txt_to_tags :body
  versioned
end
