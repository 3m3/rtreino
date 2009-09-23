Given /^I have some languages$/ do
  10.times { Factory(:language) }
end

Given /^the following languages:$/ do |languages|
  Language.create!(languages.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) language$/ do |pos|
  visit languages_url
  within("table // tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

When /^I edit the (\d+)(?:st|nd|rd|th) language$/ do |pos|
  visit languages_url
  within("table // tr:nth-child(#{pos.to_i+1})") do
    click_link "Edit"
  end
end

Then /^I should see the following languages:$/ do |expected_languages_table|
  expected_languages_table.diff!(table_at('table').to_a)
end


