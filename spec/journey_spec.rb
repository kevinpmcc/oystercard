require 'journey'

describe Journey do
  subject(:journey) { described_class.new }  


#  describe '#intialize'

#it is expected to take 0 or 1 or 2 arguments  
  

  describe '#start_journey' do
    
    it 'will store the entry_station given' do
      journey.start_journey("Bank")
      expect(journey.entry_station).to eq "Bank" 
    end


    it "will add the penalise amount to journey fare when entry_station exists" do
      journey.start_journey("Waterloo")
      expect(journey.journey_fare).to eq Journey::PENALTY_FARE
      journey.start_journey("Bank")
    end
  
  end
  
  describe '#end_journey' do

    it 'will store the exit_station given' do
      journey.end_journey("Euston")
      expect(journey.exit_station).to eq "Euston"
    end
  
  end

end


  # allow entry_station to equal something
  # it is expected to call penalise with 1 argument
  

  
