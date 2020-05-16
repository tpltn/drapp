RSpec.describe Gateways::Order do
  let(:order) { double(:order, id: SecureRandom.uuid) }

  subject { described_class.new }

  describe '#create' do
    it do
      result = subject.create(order)
      expect(result).to eq order
    end
  end

  describe '#find_by_id' do
    before(:each) { subject.create(order) }

    it do
      result_explicit = subject.find_by_id(order.id)
      result_implicit = Drapp.resolve('gateways.order').find_by_id(order.id)

      expect(result_explicit).to eq order
      expect(result_implicit).to eq order
    end
  end
end
