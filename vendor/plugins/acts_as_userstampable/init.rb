require 'acts_as_userstampable'

class ActiveRecord::Base
  extend ActsAsUserstampableModel
end

module ApplicationHelper
  extend ActsAsUserstampableHelper
end
