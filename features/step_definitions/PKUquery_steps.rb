require 'timeout'
Given /^user = "([^\"]*)"$/ do |user|
  @user = user    
  @expected_submissions = [
    {"Run ID" => "5790488",
    "User" => "rtreino",
    "Problem" => "1000",
    "Result" => "Accepted",
    "Memory" => "352K",
    "Time" => "0MS",
    "Language" => "GCC",
    "Code Length" => "113B",
    "Submit Time" => "2009-09-01 06:12:13"},
    {"Run ID" => "5790487",
    "User" => "rtreino",
    "Problem" => "1010",
    "Result" => "Wrong Answer",
    "Memory" => "",
    "Time" => "",
    "Language" => "GCC",
    "Code Length" => "113B",
    "Submit Time" => "2009-09-01 06:11:52"}
    ]
end

When /^I ask for the submissions$/ do
  @submissions = PKU.submissions_for(@user)
end

Then /^I should get the first submission$/ do
  @submissions.first.should == @expected_submissions[0]
end

Then /^I should get the first and the second submission$/ do
  @submissions[0].should == @expected_submissions[0]
  @submissions[1].should == @expected_submissions[1]
end

Then /^I should not get any submission$/ do
  @submissions.should be_empty
end

Then /^I should get the first submission from the second page$/ do
  @submissions[20].should == {"Run ID" => "5137643",
  "User" => "rtreino",
  "Problem" => "1000",
  "Result" => "Wrong Answer",
  "Memory" => "",
  "Time" => "",
  "Language" => "GCC",
  "Code Length" => "30B",
  "Submit Time" => "2009-05-12 06:49:32"}
end