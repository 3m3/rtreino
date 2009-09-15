class Statement < ActiveRecord::Base
  validates_presence_of :language_id, :body
  validates_uniqueness_of :language_id, :scope => :problem_id
  belongs_to :language  
  belongs_to :problem

  def body_html
    Txt2Tags.generate self.body, :html
  end
end
