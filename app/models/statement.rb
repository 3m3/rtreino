class Statement < ActiveRecord::Base
  belongs_to :language  
  belongs_to :problem
  belongs_to :creator, :class_name => 'User', :foreign_key => 'creator_id'
  belongs_to :updater, :class_name => 'User', :foreign_key => 'updater_id'

  validates_presence_of   :creator, :updater
  validates_presence_of   :language_id, :problem_id, :body, :title
  validates_uniqueness_of :language_id, :scope => :problem_id

  convert_txt_to_tags :body
end
