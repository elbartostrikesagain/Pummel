## Installation

Note: You may need to Install qt for capybara before using this gem.(http://qt.nokia.com/downloads)

1) Add to Gemfile:

    gem 'pummel', :git => 'git://github.com/elbartostrikesagain/Pummel'

Or, if you're developing:
 
    gem 'pummel', :path => '~/path/to/Pummel'

2) Then install it by running:

    rails g pummel:install

3) Edit your configuration (test/scalability/support/env.rb)

## Using

1) Write scripts and capybara steps to test you application(or copy them from your cucumber tests where possible :D)

2) Seed your server side database with the seed_database task in lib/tasks/pummel.rake

3) Start your choice of packet sniffer

4) Run the tests using rake pummel:run



##Examples/Hints/Notes:

In your steps, use the "test_num" variable to offset things like users.

Currently the gem only supports one script to run. This script must be in test/scalability, be a module named Script and have a method run_script



