require 'station'

describe Station do

  context 'once initialized' do
    let(:euston) { described_class.new(:name => 'Euston', :zone => 2) }

    describe '#name' do
      it 'returns the name' do
        expect(euston.name).to eq 'Euston'
      end
    end

    describe '#zone' do
      it 'returns the zone' do
        expect(euston.name).to eq 'Euston'
      end
    end
  end
end
