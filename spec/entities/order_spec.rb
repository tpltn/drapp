RSpec.describe Entities::Order do
  let(:id) { SecureRandom.uuid }

  it 'builds Order' do
    order = described_class.new(id: id, status: 'pending_publication')

    expect(order.id).to eq id
    expect(order[:id]).to eq id

    expect(order.contact).to eq nil
  end
end
