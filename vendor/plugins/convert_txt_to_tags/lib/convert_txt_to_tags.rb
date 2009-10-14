module ConvertTxtToTags
  
  def convert_txt_to_tags(*names)
    names.each do |name|
      define_method "#{name}_to_html" do
        generate_tags read_attribute(name), "html"
      end

      define_method "#{name}_to_tex" do
        generate_tags read_attribute(name), "tex"
      end
    end
    define_method "generate_tags" do |text, output_format|
       `rm -f /tmp/conv.t2t /tmp/conv.#{output_format}`
      fo = File.new("/tmp/conv.t2t", "w")
      fo.puts "\n\n\n" + text
      fo.close
      `txt2tags --no-headers -t #{output_format} --encoding=utf-8 -i /tmp/conv.t2t -o /tmp/conv.#{output_format}`
      File.open("/tmp/conv.#{output_format}").read
    end
  end
end
