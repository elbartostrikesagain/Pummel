Gem::Specification.new do |s|
  s.name         = 'pummel'
  s.version      = '0.0.1'
  s.date         = '2010-04-28'
  s.summary      = "Load testing gem"
  s.description  = "Load test your web app using capybara"
  s.authors      = ["Calvin Delamere, Gabe Kopley"]
  s.email        = 'calvin@coshx.com'
  s.require_path = "lib"
  s.homepage     = 'https://github.com/elbartostrikesagain/Pummel'
  s.add_runtime_dependency('capybara', '>= 1.1.0')
  s.add_runtime_dependency('capybara-webkit')
end
