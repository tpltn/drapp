require_relative '../base'

module Usecases
  module Orders
    class Create < Base
      include IMPORT[order_gw: 'gateways.order']

      def call(params)
        input = Inputs::Orders::Create.new.call(params)
        raise input.errors.to_h if input.failure?

        order = Entities::Order.new(id: SecureRandom.uuid, status: 'pending_publication', **input.to_h)

        Presenters::Order.render_as_hash(order_gw.create(order))
      end
    end
  end
end
