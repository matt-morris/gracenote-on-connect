require 'spec_helper'

describe Gracenote::OnConnect do
  it 'validates presence of credentials' do
    expect(Gracenote::OnConnect::API_KEY).to_not be_nil
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
