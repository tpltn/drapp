require 'dry/system/container'

# fix ArgumentError: invalid byte sequence in US-ASCII


class Drapp < Dry::System::Container
  use :env

  configure do |config|
    config.root = File.expand_path('..', __dir__)
    # config.auto_register = %w[core/gateways core/use_cases core/service_cases]
    config.env = :staging
  end

  # load_paths!('core')
end

# IMPORT = Drapp.injector
