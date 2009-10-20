class Problem < ActiveRecord::Base
  belongs_to :level  
  has_many :statements
  has_many :analyses
  has_one  :online_judge
  has_and_belongs_to_many :categories

  validates_presence_of :name, :source, :problem_type
  validates_format_of   :code, :with => /^[a-z0-9_-]+$/i, :message => "Available characters: a-z, A-Z, 0-9, '_', '-'"

  named_scope :type,   proc { |type|   { :conditions => { :problem_type => type } } }
  named_scope :source, proc { |source| { :conditions => { :source => source     } } }

  versioned
  log_model_actions

  def to_param
    self.code
  end

end
