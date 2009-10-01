# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  # put this in the body after a form to set the input focus to a specific control id
  # at end of rhtml file: <%= set_focus_to_id 'form_field_label' %>
  def set_focus_to_id(id)
    javascript_tag("$('#{id}').focus()");
  end
end
