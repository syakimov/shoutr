require 'rails_helper'

feature 'User signs in with username successfully' do
  scenario 'successfully' do
    User.create!(email: 'person@example.com', username: 'person', password: 'pass')
    visit sign_in_path

    sign_in_as('person', 'pass')

    expect(page).to have_text 'Signed in as: person@example.com'
    expect(page).to have_text 'Dashboard'
  end

  def sign_in_as(username, pass)
    fill_in 'Email or username', with: username
    fill_in 'Password', with: pass

    click_on 'Sign in'
  end
end
