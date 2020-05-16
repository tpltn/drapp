RSpec.describe Usecases::Orders::Create do
  let(:order_gw) { double(:order_gw) }

  around(:each) do |ex|
    Drapp.stub('gateways.order', order_gw)
    ex.run
    Drapp.unstub
  end

  context 'valid params' do
    let(:params) { { comment: 'comment' } }

    it 'creates order' do
      expect(order_gw).to(receive(:create)) { |order| order }

      result = described_class.new.call(params)

      expect(result[:status]).to eq 'pending_publication'
      expect(result[:comment]).to eq params[:comment]
    end
  end
end
