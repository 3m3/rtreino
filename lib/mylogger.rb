class MyLogger < Logger
  def format_message(severity, timestamp, progname, msg)
    "------->> #{timestamp.to_formatted_s(:db)}\n----------->> #{severity}\n----------------->> #{msg}\n" 
  end
end
