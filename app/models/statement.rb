class Statement < ActiveRecord::Base
  belongs_to :language  
  belongs_to :problem
  
  validates_presence_of   :language_id, :problem_id, :body, :title
  validates_uniqueness_of :language_id, :scope => :problem_id

  acts_as_userstampable
  acts_as_model_loggable
  convert_txt_to_tags :body
end
