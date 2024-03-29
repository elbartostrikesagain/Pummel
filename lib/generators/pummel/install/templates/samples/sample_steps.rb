module HelperSteps
  def email
    "user#{test_num}@loadtest.com"
  end

  def password
    "password"
  end

  def password1
    "password1"
  end

end

module ScriptSteps
  def sign_in
    visit "/users/sign_in"
    fill_in 'user_email', :with => email
    fill_in 'user_password', :with => password
    click_button 'Sign in'
    raise Exception.new("Authentication failed: #{email}/#{password}") if has_content?("Authentication Failed")
  end
end