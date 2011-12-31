class ScriptRunner
  attr_accessor :test_num, :host, :session, :rails_root

  include Scripts

  def initialize(rails_root,
                 test_num = 0,
                 host = 'http://localhost:3000')
    @rails_root = rails_root
    @session = Capybara::Session.new(:webkit)
    @test_num = test_num.to_i
    @host = host
  end

  # constantize from ActiveSupport... thank you!

  def constantize(camel_cased_word)
    names = camel_cased_word.split('::')
    names.shift if names.empty? || names.first.empty?

    constant = Object
    names.each do |name|
      constant = constant.const_defined?(name) ? constant.const_get(name) : constant.const_missing(name)
    end
    constant
  end

  def run
    begin
      #include UserPathScript
      #mixins = File.included_modules.keep_if {|x| x.to_s =~ /.*Script/}
      #mixins.each {|mixin| constantize(mixin).run}
    #Dir.glob(rails_root + '/test/scalability/*.rb') do |file|
      #  require file
      #  className = camelize(File.basename(file, ".rb"))
      #  klass =
      #  klass.new(host, test_num).run()
      #end
      run_script
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