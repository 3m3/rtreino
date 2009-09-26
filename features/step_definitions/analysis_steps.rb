Given /^the following analyses:$/ do |analyses|
  Analysis.create!(analyses.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) analysis$/ do |pos|
  visit analyses_url
  within("table > tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following analyses:$/ do |expected_analyses_table|
  expected_analyses_table.diff!(table_at('table').to_a)
end
