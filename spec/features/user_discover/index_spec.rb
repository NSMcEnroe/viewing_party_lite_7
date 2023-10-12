# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User Discover Page', type: :feature do
  xit 'displays a button to discover top rated movies and redirects to movie results page' do
    user = create(:user)

    visit "users/#{user.id}/discover"

    expect(page).to have_button('Find Top Rated Movies')

    click_button('Find Top Rated Movies')

    expect(current_path).to eq("users/#{user.id}/movies?q=top%20rated")
  end

  xit 'displays a button to search for movie original titles and redirects to movie results page' do
    user = create(:user)

    visit "users/#{user.id}/discover"

    expect(page).to have_button('Search')

    fill_in('Search', with: 'Barbie')

    click_button('Search')

    expect(current_path).to eq("users/#{user.id}/movies?q=keyword")
  end
end
