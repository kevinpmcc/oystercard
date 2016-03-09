require 'station'

describe Station do
  
  let(:Station) { described_class }
  
  it { is_expected.to respond_to(:zone) }

  it { is_expected.to respond_to(:name) }

  context "once initialized" do
    euston = Station.new("Euston", 2)
    
    describe "#name" do
      expect(euston.name).to eq("Euston")
    end

    describe "#zone" do
      expect(euston.zone).to eq 2
    end
  
  end

end
