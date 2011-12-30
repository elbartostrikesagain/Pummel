require 'cuke_scale'
require File.dirname(__FILE__) + '/../../test/scalability/support/env.rb'

namespace :cukescale do
  desc "Run load tests"
  task :run, [:num_users] => [:prepare_db] do |t, args|
    CukeScale.run
  end

  desc "Prepare test db before loadtesting"
  task :prepare_db do
    #Add what should be done before load testing
    puts "TODO prepare db"
  end
end
