# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Movie Search' do
  describe 'happy path' do
    xit 'allows user to search for movies by original title' do
      user = create(:user)

      visit "users/#{user.id}/discover"

      fill_in :search, with: 'Barbie'
      click_button 'Search'

      expect(page.status_code).to eq 200

      expect(current_path).to eq('/helloworld')

      # expect(page).to have_content("Senator Bernard Sanders was found!")
      # expect(page).to have_content("SenSanders")
    end
  end
end
