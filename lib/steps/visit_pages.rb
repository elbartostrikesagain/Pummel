module ScriptSteps

  def visit_energy_use
    go_to "/energy_use"
  end

  def visit_billing_and_usage
    go_to "/billing_and_usage"
  end

# disabled for origin 
#  def visit_pricing_plan
#    visit_energy_use
#    click_link "Pricing Plan"
#  end

  def visit_my_actions
    go_to "/my_actions"
  end

  def visit_savings
    go_to "/savings"
  end

  def visit_community
    go_to "/community"
  end

  def visit_weekly_challenges
    go_to "/weekly_challenges"
  end

  def visit_my_devices
    go_to "/my_devices"
  end

  def visit_public_profile
    go_to "/dashboard"
    click_link "Revise your goal"
    click_link "See Your Public Profile"
  end

end
