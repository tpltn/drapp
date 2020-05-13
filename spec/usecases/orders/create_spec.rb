RSpec.describe Usecases::Orders::Create do
  let(:order_gw_stub) { double(:order_gw_stub) }

  # around(:each) do |ex|
  #   Drapp.stub('gateways.order', order_gw_stub)
  #   ex.run
  #   Drapp.unstub
  # end

  context 'valid params' do
    let(:params) { { comment: 'comment' } }

    it 'creates order' do
      # TODO
      result = described_class.new(order_gw: order_gw_stub).call(params)

      expect(result[:status]).to eq 'pending_publication'
      expect(result[:comment]).to eq params[:comment]
    end
  end
end
