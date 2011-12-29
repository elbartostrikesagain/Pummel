module ScriptSteps
  def change_savings_goal
    go_to "/dashboard"
    click_link "Revise your goal"
    choose "user_savings_goal_15"
    click_button "Save"
  end
end
