class ScriptRunner
  attr_accessor :test_num, :host, :session

  include Scripts

  def initialize(test_num = 0,
                 host = 'http://localhost:3000')
    @session = Capybara::Session.new(:webkit)
    @test_num = test_num.to_i
    @host = host
  end

  def run
    begin
      puts "Run script here"
      user_path_script
      #random_script
    rescue => ex
      #save_and_open_page if session.respond_to?(:save_and_open_page)
      puts "ERROR, #{test_num}, \"#{ex.message}\""
      puts ex.backtrace
    end
  end

  def method_missing(method, *args, &block)
    if session.respond_to?(method)
      return session.__send__(method, *args, &block)
    end
    super
  end

  def rand_wait
    sleep(rand * 5.0 + 3.0)
  end

end