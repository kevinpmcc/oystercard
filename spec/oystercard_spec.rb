require 'oystercard'

describe Oystercard do
  let(:journey) { double(:journey) }
  subject(:oystercard) { described_class.new(journey_klass: journey) }
  let(:station_in) { double(:Station) }
  before(:each) { allow(journey).to receive(:new).and_return(journey)
  allow(journey).to receive(:fare).and_return(described_class::MIN_FARE) }
  let(:station_out) { double(:Station) }
  balance = described_class::MAX_BALANCE
  min_fare = described_class::MIN_FARE

  describe '#initialization' do
    it 'expect #balance to be 0' do
      expect(oystercard.balance).to be_zero
    end

    it 'expects #history to be empty' do
      expect(oystercard.history).to be_empty
    end
  end

  describe '#top_up' do
    it 'can top up balance' do
      expect { oystercard.top_up balance }.to change { oystercard.balance }.by balance
    end

    it 'fails if topup exceeds maximum balance' do
      message = "Top up exceeds the maximum balance of #{balance}"
      expect { oystercard.top_up(balance + min_fare) }.to raise_error message
    end
  end

  describe '#touch_in' do
    # it 'changes the state of #in_journey? to true' do
    #   oystercard.top_up(min_fare)
    #   expect { oystercard.touch_in station_in }.to change { oystercard.in_journey? }.to true
    # end

    it 'raises an error if balance is not sufficent for single journey' do
      message = 'Not enough funds'
      expect { oystercard.touch_in station_in }.to raise_error message
    end
  end

  # describe '#in_journey?' do
  #   it 'should never be nil' do
  #     expect(oystercard.in_journey?).to satisfy { |result| result == true || result == false }
  #   end
  # end

  describe '#touch_out' do
    it 'changes the balance' do
      allow(journey).to receive(:end)
      expect {  oystercard.touch_out station_out }.to change { oystercard.balance }.by -min_fare
    end

    it 'logs journey history' do
      oystercard.top_up(min_fare)
      # allow(journey).to receive(:start).and_return(station_in)
      oystercard.touch_in station_in
      allow(journey).to receive(:end)
      oystercard.touch_out station_out
      expect(oystercard.history).to include journey
    end
  end
end
