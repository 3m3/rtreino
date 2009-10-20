Given /^the following analyses:$/ do |analyses|
  Analysis.create!(analyses.hashes)
end

Given /^I created a analysis to problem TEST$/ do
  problem  = Factory.create(:problem, :code => 'TEST')
  analysis = Factory.create(:analysis, :problem => problem, :creator => @user)
end

Given /^I updated a analysis to problem TEST$/ do
  problem = Problem.find_by_code('TEST')
  analysis = problem.analyses.find_by_creator_id(@user.id)
  analysis.body = "changed"
  analysis.save
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
