require 'rails_helper'

RSpec.describe 'User Index Page', type: :feature do
  it 'displays the title of appliction' do
    visit '/'

    expect(page).to have_content('Viewing Party')
  end

  it 'displays a button to create a new user' do
    visit '/'

    expect(page).to have_button('Create New User')
  end

  it 'sends the user to the correct page after clicking the new user button' do
    visit '/'

    click_on('Create New User')

    expect(current_path).to eq('/register')
  end

  it 'displays a list of existing users which links to the users dashboard' do
    user_1 = create(:user)
    user_2 = create(:user)
    user_3 = create(:user)

    visit '/'

    expect(page).to have_link(user_1.name, href: "/users/#{user_1.id}")
    expect(page).to have_link(user_2.name, href: "/users/#{user_2.id}")
    expect(page).to have_link(user_3.name, href: "/users/#{user_3.id}")
  end

  it 'displays a link to go back to the landing page' do
    visit '/'

    expect(page).to have_link('All Users', href: '/')
  end
end
