# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User New Page', type: :feature do
  it 'displays a form that the user can fill in and submit' do
    visit '/register'

    fill_in('name', with: 'Peggy Sue')
    fill_in('email', with: 'psue@turing.edu')

    #Refactor Later

    click_button('Register')

    user = User.last

    expect(page).to have_content('Viewing Party')

    expect(current_path).to eq("/users/#{user.id}")
    expect(user.name).to eq('Peggy Sue')
    expect(user.email).to eq('psue@turing.edu')
  end

  xit 'denies a new user if the email is not unique' do
  end
end
