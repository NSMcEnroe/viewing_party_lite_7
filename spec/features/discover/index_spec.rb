require 'rails_helper'

RSpec.describe 'User Discover Page', type: :feature do
  it 'displays a button to discover top rated movies and redirects to movie results page', :vcr do
    user = create(:user)

    visit "users/#{user.id}/discover"

    expect(page).to have_button('Find Top Rated Movies')

    click_button('Find Top Rated Movies')

    expect(current_path).to eq("/users/#{user.id}/movies")
  end

  it 'displays a button to search for movie original titles and redirects to movie results page', :vcr do
    user = create(:user)

    visit "users/#{user.id}/discover"

    expect(page).to have_button('Search')

    fill_in('Search', with: 'Barbie')

    click_button('Search')

    expect(current_path).to eq("/users/#{user.id}/movies")
  end

  it "directs the user to the top rated movies if they use the search functionality but leave the field blank", :vcr do
    user = create(:user)

    visit "users/#{user.id}/discover"

    expect(page).to have_button('Search')

    fill_in('Search', with: '')

    click_button('Search')

    expect(current_path).to eq("/users/#{user.id}/movies")
    expect(page).to have_content("The Godfather")
  end
end
