module ActsAsUserstampableModel
  def acts_as_userstampable
    belongs_to :creator, :class_name => 'User', :foreign_key => 'creator_id'
    belongs_to :updater, :class_name => 'User', :foreign_key => 'updater_id'
    validates_presence_of :creator, :updater
  end
end

module ActsAsUserstampableHelper
  def userstamp_for(object)
    """<p class=\"userstamp\">
  <b>Created by</b>
  #{object.creator.username}
  at
  #{"%s ago" % time_ago_in_words(object.created_at)}
  |
  <b>Updated by</b>
  #{object.updater.username}
  at
  #{"%s ago" % time_ago_in_words(object.updated_at)}
</p>"""
  end
end
