require_relative 'base'

module Entities
  class Order < Base
    STATUSES = Types::Strict::String.enum('pending_publication', 'published')

    attribute :id, Types::Strict::String
    attribute :status, STATUSES
    # .optional makes type nullable
    attribute :comment, Types::Strict::String.optional.default(nil)

    # class Order::Contact defines here
    attribute? :contact do
      attribute :birthday, Types::Strict::DateTime.constructor(&:to_datetime).optional.default(nil)
    end

    # strict type check
    # Types::Strict::Bool
    # Types::Strict::Integer
    # Types::Strict::Float
    # Types::Strict::Decimal
    #
    # built-in coercion (any->float)
    # Types::Coercible::Float
    #
    # Types::Strict::String.default { ''.freeze }
    #
    # Types::Strict::Array.of(Types::Strict::String).default([].freeze)
  end
end
