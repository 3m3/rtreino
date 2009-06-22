require 'open-uri'
require 'rubygems'
require 'hpricot'
require 'timeout'

class PKU
  
  def self.submissions_for(user)
    Timeout::timeout(1) do
      response = open("http://acm.pku.edu.cn/JudgeOnline/status?user_id=rtreino")
      Hpricot(response)
      "5137643	rtreino	1000	Wrong Answer			GCC	30B	2009-05-12 06:49:32"
    end
  end
  
end