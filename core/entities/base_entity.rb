require 'dry-types'
require 'dry-struct'

class BaseEntity < Dry::Struct
  # throw an error when unknown keys provided
  schema schema.strict

  # Make the struct abstract. This class will be used as a default
  # parent class for nested structs
  abstract

  # convert string keys to symbols
  transform_keys(&:to_sym)

  # resolve default types on nil
  transform_types do |type|
    if type.default?
      type.constructor do |value|
        value.nil? ? Dry::Types::Undefined : value
      end
    else
      type
    end
  end

  module Types
    include Dry.Types()
  end

  DATETIME = Types::Strict::DateTime.constructor(&:to_datetime).optional.default(nil)
end
