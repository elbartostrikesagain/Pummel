module HelperSteps

  def go_to(relative_url)
    t0 = Time.now
    visit(host + relative_url)
    puts "GET\t#{relative_url}\t#{Time.now-t0}"
  end
end

