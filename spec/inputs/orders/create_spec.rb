RSpec.describe Inputs::Orders::Create do
  # let(:params) { { name: 'n' } }
  #
  # it 'validates params' do
  #   result = described_class.new.call(params)
  #
  #   expect(result[:id]).to eq order.id
  #   expect(result.key?(:contact)).to eq false
  # end

  context 'schemas' do
    shared_examples 'validator' do |params, errors|
      it do
        expect(schema.call(params).errors.to_h).to eq(errors)
      end
    end

    describe 'array-1' do
      let(:schema) do
        Dry::Schema.JSON do
          required(:field).array(:string)
        end
      end

      it_behaves_like 'validator', {}, { field: ['is missing'] }
      it_behaves_like 'validator', { field: nil }, { field: ['must be an array'] }
      it_behaves_like 'validator', { field: '' }, { field: ['must be an array'] }
      it_behaves_like 'validator', { field: [] }, {}
      it_behaves_like 'validator', { field: [0] }, { field: { 0 => ['must be a string'] } }
      it_behaves_like 'validator', { field: [''] }, {}
      it_behaves_like 'validator', { field: ['x'] }, {}
    end

    describe 'array-2' do
      let(:schema) do
        Dry::Schema.JSON do
          required(:field).filled(:array, min_size?: 2).each(:string, included_in?: %w[b])
        end
      end

      it_behaves_like 'validator', {}, { field: ['is missing'] }
      it_behaves_like 'validator', { field: nil }, { field: ['must be an array'] }
      it_behaves_like 'validator', { field: '' }, { field: ['must be an array'] }
      it_behaves_like 'validator', { field: [] }, { field: ['must be filled'] }
      it_behaves_like 'validator', { field: [0] }, { field: ['size cannot be less than 2'] }
      it_behaves_like 'validator',
                      { field: [0, 0] },
                      { field: { 0 => ['must be a string'], 1 => ['must be a string'] } }
      it_behaves_like 'validator',
                      { field: ['', ''] },
                      { field: { 0 => ['must be one of: b'], 1 => ['must be one of: b'] } }
      it_behaves_like 'validator', { field: %w[0 b] }, { field: { 0 => ['must be one of: b'] } }
      it_behaves_like 'validator', { field: %w[b b] }, {}
    end

    # describe 'hashes' do
    #   let(:schema) do
    #     Dry::Schema.JSON do
    #       required(:field).filled(:hash).schema do
    #         required(:b).filled(:string)
    #       end
    #     end
    #   end
    #
    #   it do
    #     expect(schema.call({}).errors.to_h).to eq({ field: ['is missing'] })
    #     expect(schema.call({}).errors.to_h).to eq({ field: ['is missing'] })
    #
    #   end
    # end

    # optional(:contact).maybe(:hash).schema do
    #   required(:email).filled(:string)
    # end
    #
    # required(:country).value(:hash) do
    #   required(:name).filled(:string)
    # end
    #
    # required(:tags).array(:hash) do
    #   required(:name).filled(:string)
    # end
    #
    # required(:people).value(:array, min_size?: 1).each do
    #   hash do
    #     required(:name).filled(:string)
    #     required(:age).filled(:integer, gteq?: 18)
    #   end
    # end
  end
end
