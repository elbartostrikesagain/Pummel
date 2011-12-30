module Cukescale
  class InstallGenerator < Rails::Generators::Base
    #Cukescale::InstallGenerator.source_root(File.expand_path("../templates", __FILE__))
    source_root File.expand_path("../templates", __FILE__)

    def create_env_rb
      empty_directory 'test'
      empty_directory 'test/scalability'
      empty_directory 'test/scalability/support'
      template 'support/env.rb', 'test/scalability/support/env.rb'
    end

    #TODO generate stuff
    def create_tasks
      empty_directory 'lib/tasks'
      template 'tasks/cukescale.rake.erb', 'lib/tasks/cukescale.rake'
    end

  end
end
