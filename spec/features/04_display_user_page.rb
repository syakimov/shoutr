require 'rails_helper'

feature 'User page displays username' do
  scenario 'successfully' do
    user = sign_in

    visit user_path(user)

    expect(page).to have_css 'h2', text: user.username
  end
end

feature 'User sees his own shouts' do
  scenario 'successfully' do
    user = sign_in
    user.shouts.create! body: 'shout_body'

    visit user_path(user)

    expect(page).to have_text 'shout_body'
  end
end
