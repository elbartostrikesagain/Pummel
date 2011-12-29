module ScriptSteps
  def onboard
    driver.render "before_page1.png"
    page1
    driver.render "page1_complete.png"
    page2
    page3
  end
end

module HelperSteps
  def page1
    fill_in "old_pwd",:with => password
    fill_in "new_pwd", :with => new_password
    fill_in "pwd_confirm", :with => new_password
    fill_in "hint", :with => "blueberries are fruity"
    session.select "What was the name of your first elementary / primary school?", :from => "security_question"
    fill_in "security_answer", :with => "school"
    fill_in "user_name", :with => "mrtidy#{id}"
   # origin has no t&c checkbox
   # check "accept-terms"
    sleep(60)
    click_button "Next"
  end

  def page2
    session.select("Detached House", :from => "Which best describes your home?")
    session.select "100 to 199 sq m", :from => "Size of home in square metres"
    session.select "1985", :from => "Year your home was built"
    choose "Rent"
    session.select "2", :from => "Number of adults living in your home"
    session.select "1", :from => "Number of children living in your home"
    choose "home_energy_questionnaire_household_category__stay_home_on_weekdays_true"
    session.select "Furnace - Oil", :from => "What type of heating does your home have?"
    session.select "No Cooling System", :from => "What type of cooling does your home have?"
    session.select "Tank - Gas", :from => "What kind of water heater do you have?"
    choose "home_energy_questionnaire_programmable_t_stat_false"
    sleep(60)
    click_button "Next"
  end


  def page3
    choose "_savings_goal_10"
    sleep(15)
    click_button "Finish"
  end

end
