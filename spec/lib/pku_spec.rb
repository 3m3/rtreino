require 'lib/pku'
require 'net/http'
require 'rubygems'
require 'hpricot'
require 'timeout'

describe PKU do

  it "should request for the submissions for the user" do
    PKU.should respond_to :submissions_for
    html = open(File.dirname(__FILE__) + "/PKU_examples/one_submission.html")
    PKU.should_receive(:open).with("http://acm.pku.edu.cn/JudgeOnline/status?user_id=rtreino").and_return(html)
    PKU.should_receive(:Hpricot).with(html)
    PKU.submissions_for("rtreino").should =~ /5137643\s+rtreino\s+1000\s+Wrong Answer\s+GCC\s+30B\s+2009-05-12\s+06:49:32/
  end
  
  it "should not break if the website is down" do
    Timeout.should_receive(:timeout).with(any_args()).and_raise(Timeout::Error)
    lambda{PKU.submissions_for("rtreino")}.should raise_error Timeout::Error
  end
  
end