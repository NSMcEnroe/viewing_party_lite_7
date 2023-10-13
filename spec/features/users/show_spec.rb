# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User Show Page', type: :feature do
  describe 'when a user visits the users_path(user)' do
    it 'displays the users name and Dashboard on the top of the page' do
      @user = create(:user)

      visit user_path(@user)

      expect(page).to have_content("#{@user.name}"'s Dashboard')
    end

    it 'displays a button to discover movies that redirects the user to the users discover page' do
      user = create(:user)

      visit user_path(user.id)

      expect(page).to have_button('Discover Movies')

      click_on('Discover Movies')

      expect(current_path).to eq(user_discover_index_path(user))
    end

    it 'displays a section that contains a list of viewing parties ' do
      user_1 = create(:user)
      create(:user)
      viewing_party_1 = create(:viewing_party)
      viewing_party_2 = create(:viewing_party)
      viewing_party_3 = create(:viewing_party)

      UserViewingParty.create(user: user_1, viewing_party: viewing_party_1, host: true)
      UserViewingParty.create(user: user_1, viewing_party: viewing_party_2, host: true)
      UserViewingParty.create(user: user_1, viewing_party: viewing_party_3, host: true)

      visit user_path(user_1.id)

      expect(page).to have_content(viewing_party_1.movie_id)
      expect(page).to have_content(viewing_party_2.movie_id)
      expect(page).to have_content(viewing_party_3.movie_id)
    end
  end
end
