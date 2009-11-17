require 'timeout'
require 'lib/livearchive'
 
Given /^id with suffix = "(.*)"$/ do |id_with_suffix|
  @id_with_suffix = id_with_suffix
  @expected_submissions = [{
        "ID" => '506276',
        "Date (UTC)" => '2009-11-10 00:02:37',
        "Status" => 'Compile Error',
        "CPU" => '0.000',
        "Memory" => 'Minimum',
        "Author" => '22122',
        "Source" => 'C',
        "Problem / Title" => '4509 - Haunted Graveyard'
        }]       
end

When /^I ask for the submissions$/ do
  @submissions = LiveArchive.submissions_for(@id_with_suffix)
end
 
Then /^I should get the first submission$/ do
  @submissions.first.should == @expected_submissions[0]
end
