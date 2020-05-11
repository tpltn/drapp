RSpec.describe Usecases::Orders::Create do
  it 'creates order' do
    result = described_class.new.call

    expect(result[:status]).to eq 'pending_publication'
  end
end
