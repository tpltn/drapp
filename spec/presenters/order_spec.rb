RSpec.describe Presenters::Order do
  let(:order) { Entities::Order.new(id: SecureRandom.uuid, status: 'pending_publication') }

  it 'presents Order' do
    result = Presenters::Order.render_as_hash(order)

    expect(result[:id]).to eq order.id
    expect(result.key?(:contact)).to eq false
  end
end
