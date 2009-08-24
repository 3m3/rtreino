require 'open-uri'
require 'rubygems'
require 'hpricot'
require 'timeout'

class PKU
  
  def self.submissions_for(user)
    Timeout::timeout(1) do
      table = Hpricot(open("http://acm.pku.edu.cn/JudgeOnline/status?user_id=#{user}")).at("//table[@class='a']")
      header = get_header(table.at("tr[@class='in']"))      
      table.search("tr[@align='center']").collect do |row|
        get_submission(row,header)
      end
    end
  end
  
  private
    
  def self.get_submission(row, header)
    s = Hash.new
    row.search("td").each_with_index do |t,i|        
      t = t.at("a") if !t.search("a").empty?
      t = t.at("font") if !t.search("font").empty?
      s[header[i]] = t.html
    end 
    s
  end
  
  def self.get_header(row)
    row.search("td").collect do |t|
      t.html
    end
  end
  
end