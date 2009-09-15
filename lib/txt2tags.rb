module Txt2Tags
  def self.generate text, type
    `rm -f /tmp/conv.t2t /tmp/conv.html`
    fo = File.new("/tmp/conv.t2t", "w")
    fo.puts "\n\n\n" + text
    fo.close
    #`txt2tags --no-headers -t #{type.to_s} --encoding=utf-8 -i /tmp/conv.t2t -o /tmp/conv.html`
    `txt2tags --no-headers -t html --encoding=utf-8 -i /tmp/conv.t2t -o /tmp/conv.html`
    File.open("/tmp/conv.html").read
  end
end
