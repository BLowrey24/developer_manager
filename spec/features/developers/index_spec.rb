require 'rails_helper'

RSpec.describe "/developers (developer index page)", type: :feature do
  # User Story 1
  describe 'as a visitor, when I visit the developer index page' do
    let!(:bungie) { Developer.create!(name: "Bungie", location: "Bellevue, Washington", num_awards: 3, still_active: true ) }
    let!(:nintendo) { Developer.create!(name: "Nintendo", location: "Redmond, WA", num_awards: 2, still_active: false ) }
    it 'I see the name of each developer' do
      # bungie = Developer.create!(name: 'Bungie', location: 'Bellevue, Washington' )
      # nintendo = Developer.create!(name: 'Nintendo', location: 'Redmond, WA' )
      visit "/developers"
      save_and_open_page

      expect(page).to have_content("Developer Index")
      expect(page).to have_content(bungie.name)
      expect(page).to have_content(nintendo.name)
    end
  end
end