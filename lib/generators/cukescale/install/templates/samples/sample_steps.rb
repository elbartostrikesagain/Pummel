module ScriptSteps
  def sign_in
    visit "/users/sign_in"
    fill_in 'user_email', :with => email
    fill_in 'user_password', :with => password
    click_button 'Sign in'
    raise Exception.new("Authentication failed: #{email}/#{password}") if has_content?("Authentication Failed")
  end
end

module HelperSteps
  def email
    "user#{test_num.to_i+1}@loadtest.com"
  end

end