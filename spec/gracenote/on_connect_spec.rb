require 'spec_helper'

describe Gracenote::OnConnect do
  describe '#setup' do
    before do
      Gracenote::OnConnect.configure do |config|
        config.api_key = ENV['ONCONNECT_API_KEY']
      end
    end

    it 'validates presence of credentials' do
      expect(Gracenote::OnConnect.configuration.api_key).to_not be_nil
    end
  end

  describe 'Theater' do
    describe 'finds by zip' do
      before do
        @theaters = Gracenote::OnConnect::Theater.find_by_zip(44113)
      end

      it 'has results' do
        expect(@theaters).to_not be_empty
      end
    end

    describe 'finds showtimes' do
      before do
        @showtimes = Gracenote::OnConnect::Theater.showtimes(2279)
      end

      it 'has results' do
        expect(@showtimes).to_not be_empty
      end
    end
  end
end
