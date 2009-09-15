class Comment < ActiveRecord::Base
  belongs_to :commentable, :polymorphic => true
  has_many :comments, :as => :commentable
  belongs_to :user

  def body_html
    Txt2Tags.generate self.body, :html
  end
end
