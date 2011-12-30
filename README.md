## Installation

Note: You may need to Install qt for capybara before using this gem.(http://qt.nokia.com/downloads)

1) Add to Gemfile:

    gem 'cuke-scale', :git => 'git://github.com/elbartostrikesagain/CukeScale'

Or, if you're developing:
 
    gem 'cuke-scale', :path => '~/path/to/CukeScale'

2) Then install it by running:

    rails g cukescale:install

3) Edit your configuration (test/scalability/support/env.rb)

## Using

1) Write scripts and capybara steps to test you application(or copy them from your cucumber tests where possible :D)

2) Seed your server side database with the seed_database task in lib/tasks/cukescale.rake

3) Start your choice of packet sniffer

4) Run the tests using rake cukescale:run



##Examples/Hints:

In your steps, use the "test_num" variable to offset things like users.



