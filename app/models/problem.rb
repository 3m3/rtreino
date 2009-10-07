class Problem < ActiveRecord::Base
  validates_presence_of :name, :source, :problem_type
  validates_format_of :code, :with => /^[a-z0-9_-]+$/i, :message => "Available characters: a-z, A-Z, 0-9, '_', '-'"
  belongs_to :level  
  has_many :statements
  has_many :analyses
  has_and_belongs_to_many :categories
  has_one :online_judge
  named_scope :type, proc { |type| { :conditions => { :problem_type => type } } }

  log_model_actions

  def to_param
    self.code
  end

end
