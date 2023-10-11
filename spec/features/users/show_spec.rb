require 'rails_helper'

RSpec.describe 'User Index Page', type: :feature do
  describe "when a user visits the users_path(user)" do
    before(:each) do
      @user = create(:user)
    end

    it "displays the users name and Dashboard on the top of the page" do
      visit user_path(@user.id)

      expect(page).to have_content("#{@user.name}"'s Dashboard')
    end
  end
end
