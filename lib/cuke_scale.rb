module CukeScale
 
  class << self
    attr_accessor :num_users, :host, :offset
    
    # default values 
    CukeScale.num_users = 1
    CukeScale.offset = 0
    CukeScale.host = 'http://localhost:3000'

    def run
      num_users.times do |i|
        puts offset
        exec "#{File.dirname(__FILE__)}/register.rb #{i+offset} #{host} " if fork.nil?
        sleep 1
      end
    end
  end
end
