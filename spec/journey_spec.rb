require 'journey'

describe Journey do
  subject(:journey) { described_class.new }  

  describe '#start_journey' do
    
    it 'will store the entry_station given' do
      journey.start_at("Bank")
      expect(journey.entry_station).to eq "Bank" 
    end
  
  end
  
  describe '#end_journey' do

    it 'will store the exit_station given' do
      journey.end_at("Euston")
      expect(journey.exit_station).to eq "Euston"
    end
  
  end
  describe '#fare' do
  

  it 'when only exit station exists returns PENALTY_FARE' do
      journey.end_at("Bank")
      expect(journey.fare).to eq Journey::PENALTY_FARE
    end

    it 'when only entry station exists returns PENALTY_FARE' do
      journey.start_at("Euston")
      expect(journey.fare).to eq Journey::PENALTY_FARE
    end
  
  end

end



  
