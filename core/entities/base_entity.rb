require 'dry-types'

class BaseEntity
end

# usage of dry-types
module Types
  include Dry.Types()
end

# types with strict type check
Types::Strict::Bool
Types::Strict::Integer
Types::Strict::Float
Types::Strict::Decimal
Types::Strict::String
Types::Strict::Date
Types::Strict::DateTime
Types::Strict::Array

# built-in coersion (int->float)
Types::Coercible::Float

# use-cases
# .optional makes type nullable
Types::Strict::String.optional.default(nil)
Types::Strict::String.default { ''.freeze }

Types::Strict::DateTime.constructor(&:to_datetime)
Types::Array.of(Types::Strict::String).default([].freeze)

# enums
Types::Strict::String.default('red').enum('blue', 'green', 'red')
Types::Strict::String.enum('locked' => 0, 'open' => 1)
