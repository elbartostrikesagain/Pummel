module ScriptSteps

  def questionnaire
    q_page1
    q_page2
    q_page3
  end

end

module HelperSteps  
  def q_page1
    go_to '/questionnaire/edit?page=home'
    session.select "Mobile Home", :from => "Which best describes your home?"
    session.select "1985", :from => "Year your home was built"
    session.select "200 to 299 sq m", :from => "Size of home in square metres"
    session.select "2", :from => "Number of adults living in your home"
    session.select "2", :from => "Number of children living in your home"
    choose "Own"
    choose "home_energy_questionnaire_household_category__stay_home_on_weekdays_true"
    session.select "Furnace - Oil", :from => "What type of heating does your home have?"
    session.select "No Cooling System", :from => "What type of cooling does your home have?"
    session.select "Tank - Gas", :from => "What kind of water heater do you have?"
    check "home_energy_questionnaire_home_detail_category__pool_pump"
    check "home_energy_questionnaire_home_detail_category__hot_tub"
    choose "home_energy_questionnaire_programmable_t_stat_false"
    click_on "Save & Continue"
  end
  def q_page2
    go_to '/questionnaire/edit?page=appliance'
    session.select "Yes", :from => "Does your refrigerator have an Energy Rating of 2.5 stars or more?"
    session.select "Yes", :from => "Does your stand alone freezer have an Energy Rating of 2.5 stars or more?"
    session.select "Yes", :from => "Does your dishwasher have an Energy Rating of 2.5 stars or more?"
    session.select "Natural Gas", :from => "What type of fuel does your oven use?"
    session.select "Natural Gas", :from => "What type of fuel does your cooktop use?"
    session.select "Yes", :from => "Does your washer have an Energy Rating of 3 stars or more?"
    session.select "Propane", :from => "What type of fuel does your dryer use?"
    session.select "3", :from => "How many televisions do you have in your home?"
    session.select "Yes", :from => "Does your television have an Energy Rating of 4 stars or more?"
    session.select "40", :from => "How many hours per week do you use the TV?"
    session.select "6", :from => "How many laptop computers do you have in your home?"
    choose "home_energy_questionnaire_solar_electric_true"
    choose "home_energy_questionnaire_solar_hot_water_false"
    click_on "Save & Continue"
  end
  def q_page3
    poop
    go_to '/questionnaire/edit?page=lighting'
    session.select "3", :from => "home_energy_questionnaire_num_incandescent"
    session.select "1", :from => "home_energy_questionnaire_hours_incandescent"
    session.select "1", :from => "home_energy_questionnaire_num_c_f_l"
    session.select "3", :from => "home_energy_questionnaire_hours_c_f_l"
    session.select "2", :from => "home_energy_questionnaire_num_flourescent"
    session.select "2", :from => "home_energy_questionnaire_hours_flourescent"
    session.select "2", :from => "home_energy_questionnaire_num_l_e_d"
    session.select "2", :from => "home_energy_questionnaire_hours_l_e_d"
    session.select "2", :from => "home_energy_questionnaire_num_halogen"
    session.select "2", :from => "home_energy_questionnaire_hours_halogen"
    click_on "Finish"
  end

end
