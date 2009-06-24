require 'open-uri'
require 'rubygems'
require 'hpricot'
require 'timeout'

class PKU
  
  def self.submissions_for(user)
    Timeout::timeout(1) do
      response = open("http://acm.pku.edu.cn/JudgeOnline/status?user_id=rtreino")
      doc = Hpricot(response)
      h = nil
      hashes = []
      doc.search("//table[@class='a']").first.search("tr").each do |l|
        if h.nil? #primeira linha
          h = []
          l.search("td").each do |t|
            h << t.html
          end
        else
          s = Hash.new
          l.search("td").each_with_index do |t,i|        
            t = t.search("a").first if !t.search("a").empty?
            t = t.search("font").first if !t.search("font").empty?
            s[h[i]] = t.html
          end
          hashes << s
        end
      end
      s = ""
      h.each do |l|
        s += hashes[0][l] + " "
      end
      s.chomp
    end
  end
  
end