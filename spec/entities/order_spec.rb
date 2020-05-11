RSpec.describe Order do
  let(:id) { SecureRandom.uuid }

  it 'builds Order' do
    order = Order.new(id: id, status: 'pending_publication')

    expect(order.id).to eq id
    expect(order[:id]).to eq id

    expect(order.published_at).to eq nil
  end
end