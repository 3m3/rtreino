Given /^the following problems:$/ do |problems|
  Problem.create!(problems.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) problem$/ do |pos|
  visit problems_url
  within("table > tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following problems:$/ do |expected_problems_table|
  expected_problems_table.diff!(table_at('table').to_a)
end