require 'rails_helper'

RSpec.describe 'Top Rated Movie Search' do
    scenario 'displays top 20 rated movies', :vcr do
      user = create(:user)

      visit "users/#{user.id}/discover"

      click_button 'Find Top Rated Movies'

      expect(page.status_code).to eq 200

      expect(current_path).to eq("/users/#{user.id}/movies")

      # expect(page).to have_content("Senator Bernard Sanders was found!")
      expect(page).to have_content("The Godfather")
    end
end