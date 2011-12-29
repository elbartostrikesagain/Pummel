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
    week_one
    week_x(2)
    week_x(3)
    week_x(4)
    week_x(5)
  end

  def week_one
    sign_in
    #onboard
    overview
    energy_use(40)

    q_page1
    sleep_scalar(120)

    visit_billing_and_usage
    sleep_scalar(15)

    ways_to_save(45)

    my_savings

    ask_expert_question
    view_question

    #community

    account_settings
    account_summary
    faqs

    go_to('/users/sign_out')
  end

  def week_x(week_num)
    sign_in
    overview
    energy_use(20)

    ways_to_save(30, "?page=#{week_num}")

    my_savings

    #community

    visit_billing_and_usage if week_num==4
    go_to('/users/sign_out')
  end

  def my_savings
    visit_savings
    actions = all('span.title')
    click_link(actions[rand(actions.length)].find('a').text)
    sleep_scalar(15)
    visit_savings
    click_link(actions[rand(actions.length)].find('a').text)
    sleep_scalar(15)
    visit_savings
    sleep_scalar(15)
    click_link('remove')
    sleep_scalar(15)
    click_link('remove')
  end

  def account_settings
    click_link("Account Settings")
    attach_file("user_avatar", "./test_avatar.jpg")
    sleep_scalar(20)
    fill_in("user_about_me", :with => "I enjoy long strolls in the park with my cat. Meow.")
    sleep_scalar(20)
    if find_field("user_user_preferences_annual_projected_cost_email")['checked']
      uncheck("user_user_preferences_annual_projected_cost_email")
    else
      check("user_user_preferences_annual_projected_cost_email")
    end
    if find_field("user_user_preferences_privacy_hide_my_household_information")['checked']
      uncheck("user_user_preferences_privacy_hide_my_household_information")
    else
      check("user_user_preferences_privacy_hide_my_household_information")
    end
    click_button("Save")
  end

  def account_summary
    click_link("Summary")
    #follow links?
  end

  def faqs
    go_to("/help")
    #This would be nice but doesn't work? :(
    #session.within(".switcher") do
    #  session.click_link("Overview")
    #  session.click_link("Your Energy Use")
    #end
    go_to('/faqs?category=Overview')
    go_to('/faqs?category=Your+Energy+Use')
  end

  def community
    #visit_community
    ##sleep_scalar(45)
    #click_link('Who is in my community?')
    ##sleep_scalar(45)
    #click_link(find('td.username').text)
    ##sleep_scalar(45)
  end

  def overview
    sleep_scalar(60)
    click_link("What is this list?")
    sleep_scalar(20)
    click_link("What activity is shown?")
    sleep_scalar(20)
    #TODO: what data is needed for this?
    #click_link("Why should I?")
    sleep_scalar(20)
  end

  def energy_use(time)
    visit_energy_use
    sleep_scalar(time)
    click_link("Your Usage Last Year")
    sleep_scalar(time)
    #TODO get the data for this?
    #session.find('div#pie_chart').trigger(:mouseover)
    sleep_scalar(time)
  end

  def ways_to_save(time, params = "")
    visit_my_actions
    session.select("Biggest Savings", :from => "sort")
    sleep_scalar(time)
    click_link("Lighting")
    sleep_scalar(time)
    click_link("How do I use Ways to Save?")
    sleep_scalar(time)
    if params.empty?
      visit_my_actions
    else
      go_to "/my_actions#{params}"
    end
    2.times do
      actions = session.all('span.title')
      action = actions[rand(actions.length)]
      click_link(action.find('a').text)
      sleep_scalar(time)
      click_link("Add to plan")
      sleep(1) #must wait for ajax
      go_to "/my_actions#{params}"
    end
  end

end
