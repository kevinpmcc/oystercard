require 'oystercard'
describe Oystercard do
  subject(:oystercard) { described_class.new }
  let(:Oystercard) { described_class }
  let(:entry_station) { double :station }
  let(:exit_station)  { double :station }
  let(:card_limit) { Oystercard::CARD_LIMIT }
  let(:journey) { double :journey }

  describe "#initialize" do
  	
    it 'will begin with a balance of 0' do
      expect(oystercard.balance).to eq 0
    end

    it 'will begin with an empty journey_history' do
      expect(oystercard.journeys).to eq []
    end

  end
  
  context 'when topped up' do
    
    before(:each) do
      oystercard.top_up(card_limit)
    end    

      describe "#touch_out" do
   
        it 'will create a new journey when there is no touch in' do
          expect{ oystercard.touch_out(exit_station) }.to change{ oystercard.journeys.size }.by 1
        end 


      it 'touching out reduces the balance' do
        oystercard.touch_in(entry_station)
        expect{ oystercard.touch_out(exit_station) }.to change{ oystercard.balance }.by -(Journey::MIN_FARE)
      end

    end    
    
    describe "#top_up" do
    
      it 'will raise if balance will be greater than card limit' do
        err = Oystercard::MAX_LIMIT_ERROR
        expect{ oystercard.top_up(card_limit)}.to raise_error(err)
      end
  
    end
  
    describe "#journeys" do

      it "stores journey history" do
        oystercard.touch_in(entry_station)
        oystercard.touch_out(exit_station)
        expect(oystercard.journeys.size).to eq 1
      end

    end 
  
  end
  
  context "with empty balance" do
    
    describe "#touch_in" do

      it 'will raise error if balance is below min balance.' do
        err = Oystercard::MIN_BAL_ERROR
        expect{ oystercard.touch_in(entry_station) }.to raise_error(err)
      end
    
    end    
      
    describe "#top_up" do
      it 'will increase the balance by the specified amount' do
        expect{ oystercard.top_up 20 }.to change{ oystercard.balance }.by(20)
      end
    
    end

  end

end

