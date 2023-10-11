# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User New Page', type: :feature do
  it 'displays a form that the user can fill in and submit' do
    visit '/register'

    fill_in('name', with: 'Peggy Sue')
    fill_in('email', with: 'psue@turing.edu')

    click_button('Register')

    user = User.last

    expect(page).to have_content('Viewing Party')

    expect(current_path).to eq("/users/#{user.id}")
    expect(user.name).to eq('Peggy Sue')
    expect(user.email).to eq('psue@turing.edu')
  end

  it 'denies a new user if the email is not unique' do
    create(:user, name: 'Alfred', email: 'psue@turing.edu')

    visit '/register'

    fill_in('name', with: 'Peggy Sue')
    fill_in('email', with: 'psue@turing.edu')

    click_button('Register')

    expect(page).to have_content('Email has already been taken')
  end

  it 'denies a new user if any field is blank' do
    visit '/register'

    fill_in('name', with: '')
    fill_in('email', with: '')

    click_button('Register')

    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Email can't be blank")
  end
end
