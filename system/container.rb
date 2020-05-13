require 'dry/system/container'

class Drapp < Dry::System::Container
  use :env

  configure do |config|
    config.root          = File.expand_path('..', __dir__)
    config.env           = ENV.fetch('ENV', :development)
    config.auto_register = %w[core/gateways]

    load_paths!('core')
  end
end

IMPORT = Drapp.injector
