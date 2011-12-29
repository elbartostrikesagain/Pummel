module ScriptSteps

  def ask_expert_question
    go_to "/expert_questions"
    fill_in 'expert_question_text', :with => "question from #{email}"
    session.select("Laundry", :from => "expert_question_category")
    #sleep(120)
    click_button "Submit"
    puts has_content?("Thank you")
  end

  def view_question
    #assuming already on /expert_questions
    click_link(find('p.title a').text)
  end

  [:laundry, :your_home, :cooling, :heating, :electronics, :water_heating, :kitchen, :lighting, :other].each do |sym|
    define_method "expert_questions_#{sym}" do
      go_to "/expert_questions?category=#{sym.to_s.split('_').map {|w| w.capitalize}.join("+")}"
    end
  end

end
