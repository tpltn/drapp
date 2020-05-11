require_relative '../base'

module Usecases
  module Orders
    class Create < Base
      def call
        order = Entities::Order.new(id: SecureRandom.uuid, status: 'pending_publication')

        Presenters::Order.render_as_hash(order)
      end
    end
  end
end
