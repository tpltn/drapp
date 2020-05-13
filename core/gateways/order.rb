require_relative 'base_repository'

module Gateways
  class Order < BaseRepository
    include IMPORT[:db]

    @@items = {}

    def save(order)
      id = order.id.to_sym
      @@items[id] = order
      find_by_id(id)
    end

    def find_by_id(id)
      @@items[id.to_sym]
    end
  end
end
