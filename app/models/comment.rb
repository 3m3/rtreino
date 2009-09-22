require File.dirname(__FILE__) + '/../../lib/txt2tags'

class Comment < ActiveRecord::Base
  belongs_to :commentable, :polymorphic => true
  has_many :comments, :as => :commentable
  belongs_to :user

  validates_presence_of :commentable_id

  def body_html
    Txt2Tags.generate self.body, :html
  end
end
