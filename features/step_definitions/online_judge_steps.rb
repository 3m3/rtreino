Given /^the following online judges:$/ do |online_judges|
  OnlineJudge.destroy_all
  OnlineJudge.create!(online_judges.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) online_judge$/ do |pos|
  visit online_judges_url
  within("table // tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following online_judges:$/ do |expected_online_judges_table|
  expected_online_judges_table.diff!(table_at('table').to_a)
end
