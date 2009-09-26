require 'term/ansicolor'
include Term::ANSIColor

desc "Running rspec and cucumber tests"
task :run_tests, :object do |t, args|
  %w[controllers models views].each do |folder|
    Dir.glob("spec/#{folder}/#{args.object}*.rb").each do |filename|
      puts yellow { bold { filename } }
      if system("spec #{filename} --format=nested --color")
        system("growlnotify -m '#{filename}' --image /Library/Ruby/Gems/1.8/gems/carlosbrando-autotest-notification-2.0.0/images/pass.png")
      else
        system("growlnotify -m '#{filename}' --image /Library/Ruby/Gems/1.8/gems/carlosbrando-autotest-notification-2.0.0/images/fail.png")
      end
      #stdout = %x[spec #{filename} --format=nested 2> /dev/null]
      #if $?.exitstatus != 0
      #  stdout.strip.each_line do |line|
      #    break if line.strip.empty?
      #    if line.index('(FAILED - ') != nil
      #      print red { bold { line } }
      #    else
      #      print line
      #    end
      #  end
      #end
    end
  end
  Dir.glob("features/manage_#{args.object}*.feature").each do |filename|
    puts yellow { bold { filename } }
    if system("cucumber #{filename}")
      system("growlnotify -m '#{filename}' --image /Library/Ruby/Gems/1.8/gems/carlosbrando-autotest-notification-2.0.0/images/pass.png")
    else
      system("growlnotify -m '#{filename}' --image /Library/Ruby/Gems/1.8/gems/carlosbrando-autotest-notification-2.0.0/images/fail.png")
    end
    #stdout = %x[cucumber -f progress #{filename}]
    #if $?.exitstatus != 0
    #  puts stdout
    #end
  end
end
