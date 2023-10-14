require 'rails_helper'

RSpec.describe 'Movies Show Page', type: :feature do
  it 'displays a button to create a viewing party', :vcr do
    user = create(:user)
  
    visit "/users/#{user.id}/movies/238"

    expect(page).to have_button('Create A Viewing Party')

    click_button('Create A Viewing Party')

    expect(current_path).to eq("/users/#{user.id}/movies/238/viewing_parties/new")
  end

  it 'displays a button to return the user back to the user discover page', :vcr do
    user = create(:user)

    visit "/users/#{user.id}/movies/238"

    expect(page).to have_button('Discover Movies')

    click_button('Discover Movies')

    expect(current_path).to eq("/users/#{user.id}/discover")
  end

  it "displays details about the movie: movie title, vote average, runtime in hours & min, genre(s), summary description", :vcr do
    user = create(:user)

    visit "/users/#{user.id}/movies/238"

    expect(page).to have_content("The Godfather")
    expect(page).to have_content("8.709")
    expect(page).to have_content("2:55")
    expect(page).to have_content("Drama, Crime")
    expect(page).to have_content("survives an attempt on his life")
  end
  
  it "displays details about the movie: the count of total reviews as well as the author and the information", :vcr do
    user = create(:user)

    visit "/users/#{user.id}/movies/238"

    expect(page).to have_content("Total Reviews: 5")
    expect(page).to have_content("futuretv")
    expect(page).to have_content("They’re both flawless crime dramas")
    expect(page).to have_content("Rating: 10.0")
  end
  # likst the first 10 cast members
  # expect(page).to have_content(@movie.cast.first_10_cast_members)
end