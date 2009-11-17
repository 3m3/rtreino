require 'lib/livearchive'
require 'net/http'
require 'rubygems'
require 'hpricot'
require 'timeout'
 
describe LiveArchive do
 
  before(:each) do
    @submission = {
        "ID" => '506276',
        "Date (UTC)" => '2009-11-10 00:02:37',
        "Status" => 'Compile Error',
        "CPU" => '0.000',
        "Memory" => 'Minimum',
        "Author" => '22122',
        "Source" => 'C',
        "Problem / Title" => '4509 - Haunted Graveyard'
        } 
  end
 
  it "should be able to get one submission" do
    LiveArchive.should respond_to :submissions_for
    html = open(File.dirname(__FILE__) + "/status.php.html")
    LiveArchive.should_receive(:open).with("http://acmicpc-live-archive.uva.es/nuevoportal/status.php?u=22122QA").and_return(html)
    LiveArchive.submissions_for('22122QA').first.should == @submission
  end
 
  it "should not break if the website is down" do
    Timeout.should_receive(:timeout).with(any_args).and_raise Timeout::Error
    lambda{LiveArchive.submissions_for('22122QA')}.should raise_error Timeout::Error
  end
  
end
