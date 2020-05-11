RSpec.describe Usecases::Orders::Create do
  context 'valid params' do
    let(:params) { {} }
    it 'creates order' do
      result = described_class.new.call(params)

      expect(result[:status]).to eq 'pending_publication'
    end
  end
end
