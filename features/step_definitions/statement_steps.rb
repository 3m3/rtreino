Given /^the following statements:$/ do |statements|
  Statement.create!(statements.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) statement$/ do |pos|
  visit statements_url
  within("table > tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following statements:$/ do |expected_statements_table|
  expected_statements_table.diff!(table_at('table').to_a)
end
