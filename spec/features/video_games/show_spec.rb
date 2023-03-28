require 'rails_helper'
#User story 4
RSpec.describe '/video_games/:id' do
  let!(:bungie) { Developer.create!(name: "Bungie", location: "Bellevue, Washington", num_awards: 2, still_active: true) }
  let!(:sie) { Developer.create!(name: "Sony Interactive Entertainment", location: "San Mateo, California", num_awards: 5, still_active: false) }
  let!(:destiny) { VideoGame.create!(name: "Destiny", price: "FTP", up_to_date: true, dlc: 6, genre: "FPS", developer_id: "#{bungie.id}") }
  let!(:gow) { VideoGame.create!(name: "God of War", price: "$59.99", up_to_date: false, dlc: 0, genre: "Hack&Slash", developer_id: "#{sie.id}") }
  it 'displays the video game name and its attributes' do
    visit "/video_games/#{destiny.id}"
    # save_and_open_page

    expect(page).to have_content("Video Game Show")
    expect(page).to have_content(destiny.name)
    expect(page).to have_content("Price: #{destiny.price}")
    expect(page).to have_content("Up to date?: #{destiny.up_to_date}")
    expect(page).to have_content("Number of DLC: #{destiny.dlc}")
    expect(page).to have_content("Genre: #{destiny.genre}")
    expect(page).to have_content("Developer ID: #{destiny.developer_id}")
  end
end