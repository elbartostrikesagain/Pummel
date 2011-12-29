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

  end
end
