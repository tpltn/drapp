RSpec.describe Usecases::Orders::Create do
  context 'valid params' do
    let(:params) { { comment: 'comment' } }
    it 'creates order' do
      result = described_class.new.call(params)

      expect(result[:status]).to eq 'pending_publication'
      expect(result[:comment]).to eq params[:comment]
    end
  end
end
