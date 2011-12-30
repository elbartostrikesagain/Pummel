#!/usr/bin/env ruby

require 'rubygems'
#require 'ruby-debug'
require 'capybara'
require 'capybara-webkit'
Dir.glob(*ARGV[0]+ '/test/scalability/*.rb') do |file|
  require file
end
require 'script_runner'
require 'fileutils'

if File.basename($0) == File.basename(__FILE__)
  test = ScriptRunner.new *ARGV.pop()
  test.run
end
