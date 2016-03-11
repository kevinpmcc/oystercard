require 'oystercard'

describe Oystercard do
  let(:journey_log) { double(:journey_log) }
  subject(:oystercard) { described_class.new(journey_log_klass: journey_log) }
  let(:station_in) { double(:Station) }
  before(:each) { allow(journey_log).to receive(:new).and_return(journey_log)
  allow(journey_log).to receive(:fare).and_return(described_class::MIN_FARE) }
  let(:station_out) { double(:Station) }
  balance = described_class::MAX_BALANCE
  let(:fare) { 1 }

  describe '#initialization' do
    it 'expect #balance to be 0' do
      expect(oystercard.balance).to be_zero
    end

    it 'creates an object' do
    expect(journey_log).to receive(:new)
    oystercard
    end
  end

  describe '#top_up' do
    it 'can top up balance' do
      expect { oystercard.top_up balance }.to change { oystercard.balance }.by balance
    end

    it 'fails if topup exceeds maximum balance' do
      message = "Top up exceeds the maximum balance of #{balance}"
      expect { oystercard.top_up(balance + 1) }.to raise_error message
    end
  end

  describe '#touch_in' do
    it 'raises an error if balance is not sufficent for single journey' do
      message = 'Not enough funds'
      expect { oystercard.touch_in station_in }.to raise_error message
    end
  end

  describe '#touch_out' do
    it 'changes the balance' do
      allow(journey_log).to receive(:finish)
      allow(oystercard).to receive(:calculate_fare) { fare }
      expect { oystercard.touch_out station_out }.to change { oystercard.balance }.by -fare
    end
  end
end
