#!/usr/bin/env ruby

require 'rubygems'
#require 'ruby-debug'
require 'capybara'
require 'capybara'
require 'capybara-webkit'
require './r_scale'
require 'fileutils'

if File.basename($0) == File.basename(__FILE__)
  test = RScale.new *ARGV
  test.run
end
