module Pummel
  class InstallGenerator < Rails::Generators::Base
    #Pummel::InstallGenerator.source_root(File.expand_path("../templates", __FILE__))
    source_root File.expand_path("../templates", __FILE__)

    def create_env_rb
      template 'support/env.rb', 'test/scalability/support/env.rb'
    end

    #TODO generate stuff
    def create_tasks
      template 'tasks/pummel.rake', 'lib/tasks/pummel.rake'
    end

    def create_test_sample
      empty_directory 'test/scalability/steps'
      template 'samples/sample_script.rb', 'test/scalability/sample_script.rb'
      template 'samples/sample_steps.rb', 'test/scalability/steps/sample_steps.rb'
    end

  end
end
