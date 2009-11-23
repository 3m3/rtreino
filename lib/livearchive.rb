require 'open-uri'
require 'rubygems'
require 'hpricot'
require 'timeout'
 
class LiveArchive
  
  def self.submissions_for(id_with_suffix, newer_than = -1)
    url_status = "http://acmicpc-live-archive.uva.es/nuevoportal/status.php?u=#{id_with_suffix}"
    all_submissions = Array.new
    Timeout::timeout(100) do
        table = Hpricot(open(url_status)).at("//table[@class='ContentTable']")
        header = get_header(table.at("tr[@class='ContentHeaderRow']"))
        table.search("tr[@align='center']").each do |row|
          submission = get_submission(row,header)
          all_submissions << submission
        end
    end    
    all_submissions
  end
 
   private

  def self.get_submission(row, header)
    s = Hash.new
    row.search("td").each_with_index do |t,i|
      original = t
      t = t.at("a") if !t.search("a").empty?
      t = t.at("font") if !t.search("font").empty?
      if(t.html =~ /&nbsp;(.*)&nbsp;/)
        s[header[i]] = $1
      else
        s[header[i]] = t.html
      end
      s[header[i]] += original.children[1].to_plain_text.rstrip if original.children.size > 1
    end
    s
  end
 
  def self.get_header(row)
    row.search("td").collect do |t|
      t.html
    end
  end
 
end
