# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  # put this in the body after a form to set the input focus to a specific control id
  # at end of rhtml file: <%= set_focus_to_id 'form_field_label' %>
  def set_focus_to_id(id)
    javascript_tag("$('#{id}').focus()");
  end

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
