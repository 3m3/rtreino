Given /^the following categories:$/ do |categories|
  Category.create!(categories.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) category$/ do |pos|
  visit categories_url
  within("table > tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following categories:$/ do |expected_categories_table|
  expected_categories_table.diff!(table_at('table').to_a)
end

Given /^I have some categories$/ do
  @categories = []
  10.times { @categories << Factory.create(:category) }
end

When /^I select the first category from "([^\"]*)"$/ do |field|
  select(@categories[0].long_name.gsub(">", "&gt;"), :from => field) 
end

Then /^first category should be selected from "([^\"]*)"$/ do |field|
  field_labeled(field).element.search(".//option[@selected = 'selected']").inner_html.should =~ /#{@categories[0].long_name.gsub(">", "&gt;")}/
end
