# rubocop:disable Metrics/BlockLength
RSpec.describe Inputs::Orders::Create do
  let(:params) { { comment: 'n' } }

  it 'validates params' do
    result = described_class.new.call(params)

    expect(result.success?).to eq true
    expect(result.to_h).to eq params
  end

  context 'schemas' do
    shared_examples 'validator' do |params, errors|
      it do
        expect(schema.call(params).errors.to_h).to eq(errors)
      end
    end

    describe 'array' do
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

    describe 'hash' do
      let(:schema) do
        Dry::Schema.JSON do
          required(:field).filled(:hash) do
            required(:bar).filled(:string)
          end
        end
      end

      it_behaves_like 'validator', {}, { field: ['is missing'] }
      it_behaves_like 'validator', { field: nil }, { field: ['must be a hash'] }
      it_behaves_like 'validator', { field: '' }, { field: ['must be a hash'] }
      it_behaves_like 'validator', { field: {} }, { field: ['must be filled'] }
      it_behaves_like 'validator', { field: { x: 0 } }, { field: ['must be filled'] }
      it_behaves_like 'validator', { field: { bar: nil } }, { field: { bar: ['must be a string'] } }
      it_behaves_like 'validator', { field: { bar: 0 } }, { field: { bar: ['must be a string'] } }
      it_behaves_like 'validator', { field: { bar: '' } }, { field: { bar: ['must be filled'] } }
      it_behaves_like 'validator', { field: { bar: 'x' } }, {}
    end

    describe 'array of hashes' do
      let(:schema) do
        Dry::Schema.JSON do
          required(:field).filled(:array).each do
            hash do
              required(:bar).filled(:string)
            end
          end
        end
      end

      it_behaves_like 'validator', {}, { field: ['is missing'] }
      it_behaves_like 'validator', { field: nil }, { field: ['must be an array'] }
      it_behaves_like 'validator', { field: '' }, { field: ['must be an array'] }
      it_behaves_like 'validator', { field: [] }, { field: ['must be filled'] }
      it_behaves_like 'validator', { field: [{ x: 0 }] }, { field: { 0 => { bar: ['is missing'] } } }
      it_behaves_like 'validator', { field: [{ bar: nil }] }, { field: { 0 => { bar: ['must be a string'] } } }
      it_behaves_like 'validator', { field: [{ bar: 0 }] }, { field: { 0 => { bar: ['must be a string'] } } }
      it_behaves_like 'validator', { field: [{ bar: '' }] }, { field: { 0 => { bar: ['must be filled'] } } }
      it_behaves_like 'validator', { field: [{ bar: 'x' }] }, {}
    end
  end
end
# rubocop:enable Metrics/BlockLength
