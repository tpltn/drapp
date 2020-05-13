require_relative 'base'

module Entities
  class Order < Base
    STATUSES = Types::Strict::String.enum('pending_publication', 'published')

    attribute :id, Types::Strict::String
    attribute :status, STATUSES
    attribute :published_at, DATETIME
    attribute :comment, Types::Strict::String.optional.default(nil)

    # class Order::Contact defines here
    attribute? :contact do
      # .optional makes type nullable
      attribute :email, Types::Strict::String.optional.default(nil)
    end

    # strict type check
    # Types::Strict::Bool
    # Types::Strict::Integer
    # Types::Strict::Float
    # Types::Strict::Decimal
    #
    # built-in coercion (int->float)
    # Types::Coercible::Float
    #
    # Types::Strict::String.default { ''.freeze }
    #
    # Types::Strict::Array.of(Types::Strict::String).default([].freeze)
  end
end
