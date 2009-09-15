class Problem < ActiveRecord::Base
  validates_presence_of :name, :source
  validates_format_of :code, :with => /^[a-z0-9_-]+$/i, :message => "Available characters: a-z, A-Z, 0-9, '_', '-'"
  belongs_to :level  
  has_many :statements
  has_many :analyses
end
