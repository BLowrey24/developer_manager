require 'rails_helper'

RSpec.describe '/developers/:id/edit', type: :feature do

  let!(:bungie) { Developer.create!(name: "Bungie", location: "Bellevue, Washington", num_awards: 3, still_active: true ) }
  let!(:sie) { Developer.create!(name: "Sony Interactive Entertainment", location: "San Mateo, California", num_awards: 5, still_active: false) }

  describe 'edit page' do
    it 'has a clickable link' do
      visit "/developers/#{bungie.id}"

      expect(page).to have_link("Update #{bungie.name}")
      save_and_open_page
      click_link("Update #{bungie.name}")
      expect(current_path).to eq("/developers/#{bungie.id}/edit")
    end
  end
end