#!/usr/bin/ruby -w

time = Time.new

past = time - 60*06*10

currentDate = time.strftime("%Y-%m-%d")
currentHour = past.strftime("%m-%d-%Y @ %H")

`wget wget http://u1819.uolsite.univision.com/applogs/mylog_#{currentDate}`


File.open("mylog_#{currentDate}") do |f|
  f.each_line do |line|
    if line =~ /Error/
        if line =~ /#{Regexp.quote(currentHour)}/
            puts "Found Error: #{line}"
        end
    end
  end
end


`rm mylog_#{currentDate}`