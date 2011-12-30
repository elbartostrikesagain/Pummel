require 'yaml'

class CukeScale
  attr_accessor :num_users, :host, :offset

  def initialize(args)
    config = read_from_config
    @num_users = args[:num_users] || config['num_users']
    @host = args[:host] || config['host']
    @offset = args[:offset] || config['offset']
    @offset = 0 if @offset.nil?
  end

  def run
    num_users.times do |i|
      puts offset
      exec "#{File.dirname(__FILE__)}/register.rb #{i+offset} #{host} " if fork.nil?
      sleep 1
    end
  end

  private
  def read_from_config
    begin
      yml_file = File.join(Rails.root, 'config', 'cukescale.yml')
      YAML::load(File.open(yml_file))
    rescue Exception => ex
      puts "Error: no config/cukescale.yml found"
    end
  end

end