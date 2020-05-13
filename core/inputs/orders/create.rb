require_relative '../base'

module Inputs
  module Orders
    class Create < Base
      # Dry::Schema.Params - http params (strings as keys, strings as values)
      # Dry::Schema.JSON - json params
      #
      # key must present && value is nullable
      # required(:comment).maybe(:string)
      #
      # key is optional
      # optional(:comment)
      #
      # value may be ''
      # required(:comment).value(:string)

      json do
        # key must present && value must present
        required(:comment).filled(:string)
      end

      # TODO:
      # https://github.com/dry-rb/dry-validation
    end
  end
end
