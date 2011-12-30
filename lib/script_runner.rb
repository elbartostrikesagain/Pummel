class ScriptRunner
  attr_accessor :id, :host, :email, :password, :new_password, :session

  include Scripts

  def initialize(id = 0,
                 email = nil,
                 password = 'password',
                 host = 'http://localhost:3000')
    @session = Capybara::Session.new(:webkit)
    @id = id
    @host = host
    if email
      @email = email
    else
      @email = "user#{id.to_i+1}@loadtest.com"
    end
    @password = password
    @new_password = "#{password}1"
  end

  def run
    begin
      puts "Run script here"
      user_path_script
      #random_script
    rescue => ex
      #save_and_open_page if session.respond_to?(:save_and_open_page)
      puts "ERROR, #{id}, \"#{ex.message}\""
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