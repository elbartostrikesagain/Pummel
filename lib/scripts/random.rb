Dir.glob(File.dirname(__FILE__) + '/steps/*') do |file|
  require file
end

module Scripts
  include HelperSteps
  include ScriptSteps

  def random_script
    sign_in
    rand_wait

    #TODO turn this back on when we have users who are not onboarded
    #onboard
    #sleep(120)

    # do the GET-only tasks in random order
    tasks_left = [:expert_questions_laundry, :expert_questions_your_home, :expert_questions_cooling, :expert_questions_heating, :expert_questions_electronics, :expert_questions_water_heating, :expert_questions_kitchen, :expert_questions_lighting, :expert_questions_other, :visit_energy_use, :visit_billing_and_usage, :visit_my_actions, :visit_savings, :visit_community, :visit_weekly_challenges, :visit_my_devices] #BT: this was failing: :visit_public_profile]

    while !tasks_left.empty?
      sleep 1
      task = tasks_left.sample
      tasks_left.delete(task)
      send(task)
    end
  end

end