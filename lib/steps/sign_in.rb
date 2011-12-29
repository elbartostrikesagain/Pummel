module ScriptSteps
  def sign_in
    go_to "/users/sign_in"
    fill_in 'user_email', :with => email
    fill_in 'user_password', :with => password
    click_button 'Sign in'
#    session.driver.render "signin.png"
    raise Exception.new("Authentication failed: #{email}/#{password}") if has_content?("Authentication Failed")
  end
end
