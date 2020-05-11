require 'dry/system/container'

class Drapp < Dry::System::Container
  use :env

  configure do |config|
    config.root = File.expand_path('..', __dir__)
    config.env  = :test #ENV.fetch('ENV')
  end

  # config.auto_register = %w[]
  # load_paths!('core')
end

# IMPORT = Drapp.injector
