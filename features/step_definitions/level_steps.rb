Given /^the following levels:$/ do |levels|
  Level.create!(levels.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) level$/ do |pos|
  visit levels_url
  within("table // tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

When /^I edit the (\d+)(?:st|nd|rd|th) level$/ do |pos|
  visit levels_url
  within("table // tr:nth-child(#{pos.to_i+1})") do
    click_link "Edit"
  end
end

Then /^I should see the following levels:$/ do |expected_levels_table|
  expected_levels_table.diff!(table_at('table').to_a)
end

Given /^I have some levels$/ do
  10.times { Factory.create(:level) }
end

