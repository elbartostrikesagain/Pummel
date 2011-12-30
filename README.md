## Installation

Note: You may need to Install qt for capybara before using this gem.(http://qt.nokia.com/downloads)

1) Add to Gemfile:

    gem 'cuke-scale', :git => 'git://github.com/elbartostrikesagain/CukeScale'

Or, if you're developing:
 
    gem 'cuke-scale', :path => '~/path/to/CukeScale'

2) Then install it by running:

    rails g cukescale:install

3) Edit your configuration (test/scalability/support/env.rb)

4) Write scripts and capybara steps to test you application(or copy them from your cucumber tests where possible :D)

5) Seed your testing database with the seed_database task in lib/tasks/cukescale.rake

6) Start your choice of packet sniffer

7) Run the tests using rake cukescale:run

