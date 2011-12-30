#!/usr/bin/env ruby

require 'rubygems'
#require 'ruby-debug'
require 'capybara'
require 'capybara-webkit'
#require 'r_scale'
require 'script_runner'
require 'fileutils'

if File.basename($0) == File.basename(__FILE__)
  test = ScriptRunner.new *ARGV
  test.run
end
