require 'rails_helper'
# user story 2
RSpec.describe '/developers/:id' do

  let!(:bungie) { Developer.create!(name: "Bungie", location: "Bellevue, Washington", num_awards: 3, still_active: true ) }
  let!(:sie) { Developer.create!(name: "Sony Interactive Entertainment", location: "San Mateo, California", num_awards: 5, still_active: false) }
  let!(:destiny) { VideoGame.create!(name: "Destiny", price: "FTP", up_to_date: true, dlc: 6, genre: "Online FPS", developer_id: "#{bungie.id}") }
  let!(:halo) { VideoGame.create!(name: "Halo Reach", price: "$59.99", up_to_date: true, dlc: 1, genre: "FPS/Story", developer_id: "#{bungie.id}") }
  let!(:gow) { VideoGame.create!(name: "God of War", price: "$59.99", up_to_date: false, dlc: 0, genre: "Hack&Slash", developer_id: "#{sie.id}") }
  
  it 'displays the devloper name and its attributes' do

    visit "/developers/#{bungie.id}"
    # save_and_open_page

    expect(page).to have_content(bungie.name)
    expect(page).to have_content("Located: #{bungie.location}")
    expect(page).to have_content("Number of awards: #{bungie.num_awards}")
    expect(page).to have_content("Still active: #{bungie.still_active}")
    expect(page).to have_content("Number of games made: #{bungie.game_count}")


    expect(page).to_not have_content(sie.name)
    expect(page).to_not have_content(sie.location)
    expect(page).to_not have_content(sie.num_awards)
    expect(page).to_not have_content(sie.still_active)
  end

  it 'has a link to the developer_video_games index' do
    visit "/developers/#{bungie.id}"
    # save_and_open_page
    expect(page).to have_link("All games for #{bungie.name}")
    click_link("All games for #{bungie.name}")
    expect(current_path).to eq("/developers/#{bungie.id}/video_games")
  end
end