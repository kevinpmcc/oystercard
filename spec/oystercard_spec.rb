require 'oystercard'
describe Oystercard do
  subject(:oystercard) { described_class.new }
  let(:Oystercard) { described_class }
  let(:entry_station) { double :station }
  let(:exit_station)  { double :station }
  let(:card_limit) { Oystercard::CARD_LIMIT }
  let(:min_fare) { Oystercard::MIN_FARE }

  describe "#initialize" do
    it 'will begin with a balance of 0' do
      expect(oystercard.balance).to eq 0
    end

    it 'will begin with a nil entry station' do
      expect(oystercard.entry_station).to eq nil
    end

    it 'will begin with an empty journey_history' do
      expect(oystercard.journeys).to eq []
    end
  end
  
  context 'when topped up' do
    
    before(:each) do
      oystercard.top_up(card_limit)
    end


    context "and touched in" do
       
      before(:each) { oystercard.touch_in(entry_station) }
    

      describe "#touch_in" do
        it 'saves the entry station' do 
          expect(oystercard.entry_station).to eq(entry_station)
        end

        it 'changes in_journey to true' do
          expect(oystercard).to be_in_journey
        end
      
      end

      describe "#touch_out" do
        it 'ends the journey' do
          oystercard.touch_out(exit_station) 
          expect(oystercard).to_not be_in_journey
        end
      
      end
      
        it 'forgets entry station on touching out' do
          oystercard.touch_out(exit_station)
          expect(oystercard.entry_station).to eq nil
        end
      end

      it 'deducts the fare' do
        expect{ oystercard.touch_out(exit_station) }.to change{ oystercard.balance }.by -(min_fare)
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

