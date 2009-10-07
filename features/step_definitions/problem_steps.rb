Given /^the following problems:$/ do |problems|
  Problem.create!(problems.hashes)
end

Given /^I have some problems$/ do
  10.times { Factory.create(:problem) }
end

Given /^I created a problem with code TEST$/ do
  Factory.create(:problem, :code => 'TEST')
end

Given /^I updated a problem with code TEST$/ do
  problem = Problem.find_by_code('TEST')
  problem.source = 'changed!'
  problem.save
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

