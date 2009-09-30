class Problem < ActiveRecord::Base
  validates_presence_of :name, :source, :problem_type
  validates_format_of :code, :with => /^[a-z0-9_-]+$/i, :message => "Available characters: a-z, A-Z, 0-9, '_', '-'"
  belongs_to :level  
  has_many :statements
  has_many :analyses
  named_scope :type, proc { |type| { :conditions => { :problem_type => type } } }

  def to_param
    self.code
  end
end
