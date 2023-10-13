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

  xit "displays details about the movie: movie title, vote avgerage, runtime in hours & min, genre(s), summary description, likst the first 10 cast members, count of total reviews as well as the author and information", :vcr do
    user = create(:user)

    visit "/users/#{user.id}/movies/238"

    expect(page).to have_content(@movie.show_movie.original_title)
    expect(page).to have_content(@movie.show_movie.vote_average)
    expect(page).to have_content(@movie.show_movie.runtime)
    expect(page).to have_content(@movie.show_movie.genre)
    expect(page).to have_content(@movie.show_movie.summary)
    expect(page).to have_content(@movie.cast.first_10_cast_members)
    expect(page).to have_content(@movie.show_movie.total_reviews_count)
    expect(page).to have_content(@movie.review_info.review_details)
  end
end