module Pummel

  #def initialize(args)
  #  config = read_from_config
  #  @num_test_iterations = args[:num_test_iterations] || config['num_test_iterations']
  #  @host = args[:host] || config['host']
  #  @offset = args[:offset] || config['offset']
  #  @offset = 0 if @offset.nil?
  #  @rails_root = args[:rails_root]
  #end

  class << self
    attr_accessor :num_test_iterations, :host, :offset, :rails_root

    # default values
    Pummel.num_test_iterations = 1
    Pummel.offset = 0
    Pummel.host = 'http://localhost:3000'

    def run
      raise "Unknown rails_root path. Please define rails_root in test/scalability/support/env.rb" if rails_root.nil? || rails_root == ""
      num_test_iterations.times do |i|
        exec "#{File.dirname(__FILE__)}/register.rb #{rails_root} #{i+offset} #{host} " if fork.nil?
        sleep 1
      end
    end
  end
end