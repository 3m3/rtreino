require 'open-uri'
require 'rubygems'
require 'hpricot'
require 'timeout'
 
class PKU
  
  def self.submissions_for(user, newer_than = -1)
    url_status = "http://acm.pku.edu.cn/JudgeOnline/status?user_id=#{user}"
    #http://acmicpc-live-archive.uva.es/nuevoportal/status.php?u=22122QA
    all_submissions = Array.new
    last_run_id = nil
    while true do
      Timeout::timeout(100) do
        table = Hpricot(open(url_status + (last_run_id.nil? ? "" : "&top=#{last_run_id}"))).at("//table[@class='a']")
        header = get_header(table.at("tr[@class='in']"))
        table.search("tr[@align='center']").collect do |row|
          submission = get_submission(row,header)
          all_submissions << submission if submission["Run ID"].to_i > newer_than.to_i
        end
      end
      break if all_submissions.empty? or last_run_id == all_submissions.last["Run ID"]
      last_run_id = all_submissions.last["Run ID"]
    end
    all_submissions
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
