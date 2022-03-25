require 'rails_helper'

describe Artist, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
  end

  describe "relationships" do
    it { should have_many :songs }
  end

  describe 'instance methods' do
    describe '#average_song_length' do
      before :each do
        @prince = Artist.create!(name: 'Prince')
        @purple = @prince.songs.create(title: 'Purple Rain', length: 500, play_count: 900)
        @beret = @prince.songs.create(title: 'Raspberry Beret', length: 540, play_count: 9000)
      end

      it 'returns the average song length' do
        expect(@prince.average_song_length).to eq(520)
      end
    end
  end
end
