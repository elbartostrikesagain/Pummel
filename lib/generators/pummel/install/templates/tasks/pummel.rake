require 'pummel'
require File.dirname(__FILE__) + '/../../test/scalability/support/env.rb'

namespace :pummel do
  desc "Run load tests"
  task :run, [:num_test_iterations] do |t, args|
    #args = args.to_hash.merge({:rails_root => Rails.root.to_s})
    #test = Pummel.new args
    #test.run
    Pummel.run
  end

  desc "Prepare test db before loadtesting"
  task :seed_database do
    #Add what should be done before load testing
  end
end
