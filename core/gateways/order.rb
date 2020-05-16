require_relative 'base_repository'

module Gateways
  class Order < BaseRepository
    include IMPORT[:db]

    # rubocop:disable Style/ClassVars
    @@items = {}
    # rubocop:enable Style/ClassVars

    def create(order)
      # db.create(order)
      id = order.id.to_sym
      @@items[id] = order
      find_by_id(id)
    end

    def find_by_id(id)
      @@items[id.to_sym]
    end
  end
end
