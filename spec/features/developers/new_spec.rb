require 'rails_helper'

RSpec.describe 'Developer creation', type: :feature do

  it 'links to the new page from the developer index' do
    visit '/developers'

    click_link("New Developer")
    expect(current_path).to eq("/developers/new")
  end

  it 'can create a new developer' do
    visit '/developers/new'

    fill_in('name', with: 'Naughty Dog')
    fill_in('location', with: 'SM, California')
    fill_in('num_awards', with: 10)
    check('still_active')
    click_button('Create Developer')
    expect(current_path).to eq("/developers")
    expect(page).to have_content("Naughty Dog")
  end
end