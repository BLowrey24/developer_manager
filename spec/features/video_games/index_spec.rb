require 'rails_helper'

RSpec.describe "/video_games", type: :feature do
  # user story 3
  describe "As a visitor, when I visit the video_games index page" do
    let!(:bungie) { Developer.create!(name: "Bungie", location: "Bellevue, Washington", num_awards: 2, still_active: true) }
    let!(:sie) { Developer.create!(name: "Sony Interactive Entertainment", location: "San Mateo, California", num_awards: 3, still_active: true) }
    let!(:destiny) { VideoGame.create!(name: "Destiny", price: "FTP", up_to_date: true, dlc: 6, genre: "FPS", developer_id: "#{bungie.id}") }
    let!(:gow) { VideoGame.create!(name: "God of War", price: "$59.99", up_to_date: false, dlc: 0, genre: "Hack&Slash", developer_id: "#{sie.id}") }
    it "I see each video_game and their attributes" do

      visit "/video_games"
      save_and_open_page

      expect(page).to have_content("Video Games Index Page")
      expect(page).to have_content("Name: #{destiny.name}")
      expect(page).to have_content("Price: #{destiny.price}")
      expect(page).to have_content("Up to date: #{destiny.up_to_date}")
      expect(page).to have_content("DLC's: #{destiny.dlc}")
      expect(page).to have_content("Genre: #{destiny.genre}")
      expect(page).to have_content("Developer: #{destiny.developer_id}")
      
      expect(page).to have_content("Name: #{gow.name}")
      expect(page).to have_content("Price: #{gow.price}")
      expect(page).to have_content("Up to date: #{gow.up_to_date}")
      expect(page).to have_content("DLC's: #{gow.dlc}")
      expect(page).to have_content("Genre: #{gow.genre}")
      expect(page).to have_content("Developer: #{gow.developer_id}")
    end
  end
end