class InstallGenerator < Rails::Generators::Base
  #TODO generate stuff
  def create_initializer_file
    empty_directory 'features'
  end
end
