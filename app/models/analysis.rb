require File.dirname(__FILE__) + '/../../lib/txt2tags'

class Analysis < ActiveRecord::Base
  validates_presence_of :body, :problem, :user
  belongs_to :problem
  belongs_to :user
  has_many :comments, :as => :commentable

  def body_html
    Txt2Tags.generate self.body, :html
  end
end
