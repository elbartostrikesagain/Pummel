#!/usr/bin/env ruby


nregistrations = ARGV[0].to_i
logfile = "register.out"

`rm -f register.out.*`

nregistrations.times do |i|
  offset = 38
  # assuming Xvfb is started with this command:
  #  Xvfb :1 -screen 0 1024x768x16 -nolisten inet6 &
  exec "DISPLAY=:1.0 #{File.dirname(__FILE__)}/register.rb #{i+offset} >> register.out.#{i+offset}" if fork.nil?
  sleep 1
end
