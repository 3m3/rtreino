require 'lib/pku'
require 'net/http'
require 'rubygems'
require 'hpricot'
require 'timeout'

describe PKU do

  it "should be able to get one submission" do
    submission = {"Run ID" => "5137643",
                  "User" => "rtreino",
                  "Problem" => "1000",
                  "Result" => "Wrong Answer",
                  "Memory" => "",
                  "Time" => "",
                  "Language" => "GCC",
                  "Code Length" => "30B",
                  "Submit Time" => "2009-05-12 06:49:32"}
    PKU.should respond_to :submissions_for
    html = open(File.dirname(__FILE__) + "/PKU_examples/one_submission.html")
    PKU.should_receive(:open).with("http://acm.pku.edu.cn/JudgeOnline/status?user_id=rtreino").and_return(html)
    PKU.submissions_for("rtreino").first.should == submission
  end
  
  it "should not break if the website is down" do
    Timeout.should_receive(:timeout).with(any_args).and_raise Timeout::Error
    lambda{PKU.submissions_for("rtreino")}.should raise_error Timeout::Error
  end
  
  it "should be able to get the first submission of the second page" do
    # http://acm.pku.edu.cn/JudgeOnline/status?user_id=rtreino&top=5747447
    # http://acm.pku.edu.cn/JudgeOnline/status?user_id=rtreino
  end
  
end