require_relative 'base'

module Presenters
  class Order < Base
    field :id
    field :status
  end
end
