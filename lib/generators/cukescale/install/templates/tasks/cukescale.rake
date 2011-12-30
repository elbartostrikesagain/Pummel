require 'cuke_scale'
require File.dirname(__FILE__) + '/../../test/scalability/support/env.rb'

namespace :cukescale do
  desc "Run load tests"
  task :run, [:num_test_iterations] do |t, args|
    #args = args.to_hash.merge({:rails_root => Rails.root.to_s})
    #test = CukeScale.new args
    #test.run
    CukeScale.run
  end

  desc "Prepare test db before loadtesting"
  task :seed_database do
    #Add what should be done before load testing
    raise "You never created any data prior to running the tests! (Delete this once you start to edit the seed_database task to your liking.)"
  end
end
