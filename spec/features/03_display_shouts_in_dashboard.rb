require 'rails_helper'

feature 'Dashboard displays shouts' do
  scenario 'successfully' do
    user = create_user
    user.shouts.create(body: 'shout body')

    sign_in_as(user)

    expect(page).to have_text 'shout body'
  end

  def sign_in_as(user)
    visit sign_in_path

    fill_in 'Email or username', with: user.username
    fill_in 'Password', with: user.password

    click_on 'Sign in'
  end

  def create_user(options = {})
    options = { email: 'person@example.com',
                username: 'person',
                password: 'pass' }.merge(options)
    User.create! options
  end
end
