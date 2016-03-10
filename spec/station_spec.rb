require 'station'

describe Station do

  context 'once initialized' do
    let(:euston) { described_class.new('Euston',1) }

    describe '#name' do
      it 'returns the name' do
        expect(euston.name).to eq 'Euston'
      end
    end

    describe '#zone' do
      it 'returns the zone' do
        expect(euston.zone).to eq 1
      end
    end
  end
end
