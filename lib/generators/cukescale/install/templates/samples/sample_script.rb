Dir.glob(File.dirname(__FILE__) + '/steps/*') do |file|
  require file
end

module Scripts
  include HelperSteps
  include ScriptSteps

  def sleep_scalar(seconds)
    scalar = 1
    sleep(seconds * scalar)
  end

  def user_path_script
    sign_in
  end

end