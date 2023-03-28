require 'rails_helper'

RSpec.describe Developer, type: :model do
  describe 'relationships' do
    it { should have_many :video_games } 
  end

  describe 'class methods' do

    let!(:bungie) { Developer.create!(name: "Bungie", location: "Bellevue, Washington", num_awards: 3, still_active: true ) }
    let!(:nintendo) { Developer.create!(name: "Nintendo", location: "Redmond, WA", num_awards: 2, still_active: false ) }

    describe '::most_recent' do
      it 'returns all of the developers sorted by most recent' do
        expect(Developer.most_recent).to eq([nintendo, bungie])
      end
    end
  end

  describe 'instance methods' do
    
    let!(:bungie) { Developer.create!(name: "Bungie", location: "Bellevue, Washington", num_awards: 2, still_active: true) }
    let!(:sie) { Developer.create!(name: "Sony Interactive Entertainment", location: "San Mateo, California", num_awards: 3, still_active: true) }
    let!(:destiny) { VideoGame.create!(name: "Destiny", price: "FTP", up_to_date: true, dlc: 6, genre: "Online FPS", developer_id: "#{bungie.id}") }
    let!(:halo) { VideoGame.create!(name: "Halo Reach", price: "$59.99", up_to_date: true, dlc: 1, genre: "FPS/Story", developer_id: "#{bungie.id}") }
    let!(:gow) { VideoGame.create!(name: "God of War", price: "$59.99", up_to_date: false, dlc: 0, genre: "Hack&Slash", developer_id: "#{sie.id}") }

    describe '#game_count' do
      it 'returns the number of games a developer has' do
        expect(bungie.game_count).to eq(2)
      end
    end
  end
end
