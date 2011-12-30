#!/usr/bin/env ruby

require 'rubygems'
#require 'ruby-debug'
require 'capybara'
require 'capybara-webkit'
Dir.glob(*ARGV[0]+ '/load_tests/*.rb') do |file|
  puts "require: " + file
  require file
end
require 'script_runner'
require 'fileutils'

if File.basename($0) == File.basename(__FILE__)
  test = ScriptRunner.new *ARGV.shift()
  test.run
end
