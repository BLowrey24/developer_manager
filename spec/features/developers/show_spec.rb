require 'rails_helper'
# user story 2
RSpec.describe '/developers/:id' do
  let!(:bungie) { Developer.create!(name: "Bungie", location: "Bellevue, Washington", num_awards: 3, still_active: true ) }
  let!(:sie) { Developer.create!(name: "Sony Interactive Entertainment", location: "San Mateo, California", num_awards: 5, still_active: false) }
  it 'displays the devloper title and attributes' do

    visit "/developers/#{bungie.id}"
    save_and_open_page

    expect(page).to have_content(bungie.name)
    expect(page).to have_content("Located: #{bungie.location}")
    expect(page).to have_content("Number of awards: #{bungie.num_awards}")
    expect(page).to have_content("Still active: #{bungie.still_active}")


    expect(page).to_not have_content(sie.name)
    expect(page).to_not have_content(sie.location)
    expect(page).to_not have_content(sie.num_awards)
    expect(page).to_not have_content(sie.still_active)

  end
end