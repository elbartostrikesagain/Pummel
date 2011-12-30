module CukeScale

  #def initialize(args)
  #  config = read_from_config
  #  @num_users = args[:num_users] || config['num_users']
  #  @host = args[:host] || config['host']
  #  @offset = args[:offset] || config['offset']
  #  @offset = 0 if @offset.nil?
  #  @rails_root = args[:rails_root]
  #end

  class << self
    attr_accessor :num_users, :host, :offset, :rails_root

    # default values
    CukeScale.num_users = 1
    CukeScale.offset = 0
    CukeScale.host = 'http://localhost:3000'

    def run
      num_users.times do |i|
        exec "#{File.dirname(__FILE__)}/register.rb #{rails_root} #{i+offset} #{host} " if fork.nil?
        sleep 1
      end
    end
  end
end