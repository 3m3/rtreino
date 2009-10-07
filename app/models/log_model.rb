class LogModel < ActiveRecord::Base
  validates_presence_of :loggable_id, :loggable_type, :action
end
