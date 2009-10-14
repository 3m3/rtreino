class Statement < ActiveRecord::Base
  validates_presence_of :language_id, :problem_id, :body, :title
  validates_uniqueness_of :language_id, :scope => :problem_id
  belongs_to :language  
  belongs_to :problem
  convert_txt_to_tags :body
end
