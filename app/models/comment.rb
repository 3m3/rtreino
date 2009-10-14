class Comment < ActiveRecord::Base
  belongs_to :commentable, :polymorphic => true
  has_many :comments, :as => :commentable
  belongs_to :user

  validates_presence_of :commentable_id
  convert_txt_to_tags :body
end
