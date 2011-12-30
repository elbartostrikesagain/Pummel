module Cukescale
  class InstallGenerator < Rails::Generators::Base
    #Cukescale::InstallGenerator.source_root(File.expand_path("../templates", __FILE__))
    source_root File.expand_path("../templates", __FILE__)

    #TODO generate stuff
    def create_tasks
      empty_directory 'lib/tasks'
      template 'tasks/cukescale.rake.erb', 'lib/tasks/cukescale.rake'
    end

    def create_templates
      template 'config/cukescale.yml.erb', 'config/cukescale.yml'
    end

    def create_test_sample
      empty_directory 'load_tests/steps'
      template 'load_tests/sample_script.rb.erb', 'load_tests/sample_script.rb'
      template 'load_tests/steps/sample_steps.rb.erb', 'load_tests/steps/sample_steps.rb'
    end

  end
end
