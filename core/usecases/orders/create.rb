require_relative '../base'

module Usecases
  module Orders
    class Create < Base
      def call(params)
        input = Inputs::Orders::Create.new.call(params)
        raise RuntimeError, input.errors if input.failure?

        order = Entities::Order.new(id: SecureRandom.uuid, status: 'pending_publication', **input.to_h)

        Presenters::Order.render_as_hash(order)
      end
    end
  end
end
