require 'rails_helper'

feature 'User signs up successfully' do
  scenario 'successfully' do
    sign_up('person@example.com', 'person', 'password')

    expect(page).to have_text 'Signed in as: person@example.com'
  end

  scenario 'unsuccessfully when username is taken' do
    create_user(username: 'taken')

    sign_up('person@example.com', 'taken', 'password')

    expect(page).not_to have_text 'Signed in as: person@example.com'
  end

  def sign_up(email, username, pass)
    visit sign_up_path

    fill_in 'Email', with: email
    fill_in 'Username', with: username
    fill_in 'Password', with: pass

    click_on 'Sign up'
  end
end
