require_relative '../base'

module Inputs
  module Orders
    class Create < Base
      # schema - no coercions (Dry::Schema)
      # json - Dry::Schema.JSON
      # params - Dry::Schema.Params (http params coercions: strings as keys, strings as values)

      json do
        # key must present && value must present
        required(:comment).filled(:string)

        # key must present && value is nullable
        # required(:comment).maybe(:string)
        #
        # key is optional
        # optional(:comment)
        #
        # value may be ''
        # required(:comment).value(:string)
      end

      # rule(contact: [:birthday, ..]) - execute if schema for path succeed
      # rule(..).each - apply to array items
      rule(:comment) do
        if value == 'UNEXPECTED'
          # select first key from rule() args
          key.failure('UNEXPECTED')

          # key(:x).failure('x')
        end

        # key? - key comment present?
        # value - eq to input[:comment]
        # values - eq to input
      end

      # rule do
      #   base.failure('base error => {nil=>["base error"]}')
      # end

      register_macro(:string_validator) do |macro:|
        arg0 = macro.args[0]
        key.failure('42') if arg0 != 42
      end

      rule(:comment).validate(string_validator: 42)
    end
  end
end
