Then /^"([^"]*)" should be selected for "([^"]*)"$/ do |value, field|
    field_labeled(field).element.search(".//option[@selected = 'selected']").inner_html.should =~ /#{value}/
end

# Use this to fill in an entire form with data from a table. Example:
#
#   When I fill in the following:
#     | Account Number | 5002       |
#     | Expiry date    | 2009-11-01 |
#     | Note           | Nice guy   |
#     | Wants Email?   |            |
#
# TODO: Add support for checkbox, select og option
# based on naming conventions.
#
Then /^the fields in following should contain:$/ do |fields|
  fields.rows_hash.each do |name, value|
    When %{the "#{name}" field should contain "#{value}"}
  end
end

When /^I fill first field "([^\"]*)" with "([^\"]*)"$/ do |field, value|
  
end


