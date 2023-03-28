require 'rails_helper'

RSpec.describe "/developers/developerID/video_games", type: :feature do
  
  let!(:bungie) { Developer.create!(name: "Bungie", location: "Bellevue, Washington", num_awards: 2, still_active: true) }
  let!(:sie) { Developer.create!(name: "Sony Interactive Entertainment", location: "San Mateo, California", num_awards: 3, still_active: true) }
  let!(:destiny) { VideoGame.create!(name: "Destiny", price: "FTP", up_to_date: true, dlc: 6, genre: "Online FPS", developer_id: "#{bungie.id}") }
  let!(:halo) { VideoGame.create!(name: "Halo Reach", price: "$59.99", up_to_date: true, dlc: 1, genre: "FPS/Story", developer_id: "#{bungie.id}") }
  let!(:gow) { VideoGame.create!(name: "God of War", price: "$59.99", up_to_date: false, dlc: 0, genre: "Hack&Slash", developer_id: "#{sie.id}") }

  describe 'when I visit the page I see each video game associated with
  that developer' do
    it 'shows the developer name and then all the video games with their attributes' do
      visit "/developers/#{bungie.id}/video_games"
      # save_and_open_page

      expect(page).to have_content("Developer Video Games Index")
      expect(page).to have_content(bungie.name)
      expect(page).to have_content(destiny.name)
      expect(page).to have_content(destiny.price)
      expect(page).to have_content(destiny.up_to_date)
      expect(page).to have_content(destiny.dlc)
      expect(page).to have_content(destiny.genre)
      expect(page).to have_content(halo.name)
      expect(page).to have_content(halo.price)
      expect(page).to have_content(halo.up_to_date)
      expect(page).to have_content(halo.dlc)
      expect(page).to have_content(halo.genre)
    end
  end
end