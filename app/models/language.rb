class Language < ActiveRecord::Base
  validates_presence_of :abbreviation,  :name
  validates_format_of :abbreviation, :with => /^[a-z][a-z]([_-][A-Z][A-Z])?$/, :message => "invalid. Try: pt or pt-BR"
  validates_uniqueness_of :abbreviation, :name
end
