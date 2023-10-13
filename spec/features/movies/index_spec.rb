require 'rails_helper'

RSpec.describe 'Movies Index Page', type: :feature do
  it 'displays a button to return the user back to the user discover page', :vcr do
    user = create(:user)

    visit "/users/#{user.id}/movies"

    expect(page).to have_button('Discover Movies')

    click_button('Discover Movies')

    expect(current_path).to eq("/users/#{user.id}/discover")
  end

  it "takes the user to the movie show page when clicking a movie", :vcr do
    user = create(:user)

    visit "/users/#{user.id}/movies"
    
    click_link("The Godfather")
    
    expect(current_path).to eq("/users/#{user.id}/movies/238")
  end
end