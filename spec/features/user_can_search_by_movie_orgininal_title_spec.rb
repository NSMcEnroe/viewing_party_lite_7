# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Movie Search' do
    it 'allows user to search for movies by original title', :vcr do
      user = create(:user)

      visit "users/#{user.id}/discover"

      fill_in :query, with: 'Eraserhead'
      click_button 'Search'


      expect(page.status_code).to eq 200

      expect(current_path).to eq("/users/#{user.id}/movies")

      expect(page).to have_content("Eraserhead")
    end
end
