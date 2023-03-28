require 'rails_helper'

RSpec.describe 'application' do
  describe 'nav links' do
    it 'shows a link to the video game index at the top of the page' do
      visit '/developers'
      expect(page).to have_link("All Video Games")
      click_link("All Video Games")
      expect(current_path).to eq("/video_games")
    end

    it 'shows a link to the developer index at the top of the page' do
      visit '/video_games'
      expect(page).to have_link("All Developers")
      click_link("All Developers")
      expect(current_path).to eq("/developers")
    end
  end
end