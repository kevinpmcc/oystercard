require 'station'

describe Station do
  
  describe "once initialized" do
   before(:each) { euston = Station.new("Euston", 2) }
    
    describe "#name" do
      it 'returns the name' do
        expect(euston.name).to eq("Euston")
      end
   
    end

    describe "#zone" do
      it 'returns the zone' do
        expect(euston.zone).to eq 2
      end
      
    end
  
  end

end
