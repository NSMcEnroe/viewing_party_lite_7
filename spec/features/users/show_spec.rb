require 'rails_helper'

RSpec.describe 'User Index Page', type: :feature do
  describe "when a user visits the users_path(user)" do
    before(:each) do
      @user = create(:user)
    end

    it "displays the users name and Dashboard on the top of the page" do
      visit users_path(@user.id)

    end
  end
end
